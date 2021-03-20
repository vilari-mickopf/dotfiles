#! /usr/bin/env python

import argparse

from cproject import run_c, parse_c
from pyproject import run_py, parse_py

from project import Project


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument('-f', '--file', type=str)
    parser.add_argument('-l', '--lang', type=str)
    parser.add_argument('-a', '--args', type=str, nargs='+')
    parser.add_argument('-o', '--open', action='store_true')

    args = parser.parse_args()
    if args.args is None:
        args.args = []
    return args


if __name__ == '__main__':
    args = parse_args()

    # Set project
    project = Project(args.file, args.args)
    if args.lang in ['c', 'cpp']:
        parse_c(project)
    elif args.lang == 'py':
        parse_py(project)
    else:
        pass

    # Project file
    project.parse_project_file('.' + args.lang + 'project')

    if args.open:
        if project.project_file is None:
            project.create_project_file('.' + args.lang + 'project')
        exit(project.project_file)

    if args.lang in ['c', 'cpp']:
        run_c(project)

    elif args.lang == 'py':
        run_py(project)

    else:
        pass
