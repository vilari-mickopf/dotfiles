#! /usr/bin/env python

import os
import argparse
import json

from shutil import copyfile

from project import Project

from cproject import parse_c
from pyproject import parse_py


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument('-f', '--file', type=str)
    parser.add_argument('-l', '--lang', type=str)
    parser.add_argument('-a', '--args', type=str, nargs='+')
    parser.add_argument('-t', '--target', action='store_true')
    parser.add_argument('-r', '--reset', action='store_true')
    parser.add_argument('-o', '--open', action='store_true')

    args = parser.parse_args()
    if args.args is None:
        args.args = []
    return args


if __name__ == '__main__':
    args = parse_args()

    project = Project(args.file, args.args)
    if args.lang in ['c', 'cpp']:
        parse_c(project)
    elif args.lang == 'py':
        parse_py(project)
    else:
        pass

    # Project file
    project.parse_project_file('.' + args.lang + 'project')

    # Check file
    debug_file = os.path.join(project.root, '.vimspector.json')
    debug_template_file = os.path.expanduser('~/.local/share/nvim/site/vimspector/' +
                                             args.lang + '.json')

    if args.reset and os.path.isfile(debug_file):
        os.remove(debug_file)

    if not os.path.isfile(debug_file):
        copyfile(debug_template_file, debug_file)
        with open(debug_file, 'r') as f:
            vimspector = json.loads(f.read())

        if args.target:
            bin = project.find_bin()
            if bin is not None:
                bin_relpath = '${workspaceRoot}/' + bin
                vimspector['configurations']['Debug']['configuration']['program'] = bin_relpath

        with open(debug_file, 'w') as f:
            json.dump(vimspector, f, indent=4)

    with open(debug_file, 'r') as f:
        vimspector = json.loads(f.read())

    if args.lang == 'py':
        if project.run_path is None:
             run_path = project.current_file
        else:
             run_path = project.run_path

        run_relpath = '${workspaceRoot}/' + os.path.relpath(run_path, project.root)
        vimspector['configurations']['Debug']['configuration']['program'] = run_relpath

    with open(debug_file, 'w') as f:
        json.dump(vimspector, f, indent=4)

    #  Open file
    if args.open:
        exit(debug_file)

    for arg in args.args:
        vimspector['configurations']['Debug']['configuration']['args'].append(arg)

    with open(debug_file, 'w') as f:
        json.dump(vimspector, f, indent=4)
