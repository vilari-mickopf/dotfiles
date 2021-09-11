#! /usr/bin/env python

import os
import stat
import re
import argparse

import json

from itertools import product


class Project:
    def __init__(self, current_file, args=[]):
        self.current_file = current_file

        self.root = None
        self.project_marker = None
        self.project_file = None
        self.run_path = None

        self.args = args
        self.post = []

    def create_project_file(self, name):
        if self.root is None:
            return

        self.project_file  = os.path.join(self.root, name)

        with open(self.project_file, 'w') as f:
            f.write('{\n')
            f.write('\t"path": "",\n')
            f.write('\t"args": [],\n')
            f.write('\t"post": []\n')
            f.write('}\n')

    def parse_project_file(self, filename):
        if not os.path.isfile(os.path.join(self.root, filename)):
            return True

        project_file = os.path.join(self.root, filename)

        try:
            data = json.load(open(project_file))
        except json.decoder.JSONDecodeError:
            return False

        if self.args == [] and 'args' in data:
            [self.args.append(a) for a in data['args']]

        if 'post' in data:
            [self.post.append(p) for p in data['post']]

        if 'path' in data and data['path'] != '':
            self.run_path = data['path']

        return True

    def __find_project_marker(self, project_files, project_dirs):
        current_dir = os.getcwd()
        os.chdir(os.path.dirname(self.current_file))
        try:
            while os.getcwd() != '/':
                for _, dirs, files in os.walk(os.getcwd()):
                    for file, project_file in product(files, project_files):
                        if re.match(project_file, os.path.basename(file)):
                            self.project_file = os.path.abspath(file)
                            return os.path.abspath(file)

                    for dir, project_dir in product(dirs, project_dirs):
                        if re.match(project_dir, os.path.basename(dir)):
                            return os.path.abspath(dir)

                    # Don't go recursivly deeper to folder structure, check only
                    # files and folders in the current folder
                    break

                # Go to dir before
                os.chdir('..')
        finally:
            os.chdir(current_dir)

    def __parse_root(self, run_files):
        exclude = set(['\.git', '\.ccls_cache', '\.objs', '.*\.egg-info'])
        for _, dirs, files in os.walk(self.root):
            [dirs.remove(d) for d in list(dirs)
                for e in exclude if re.match(e, os.path.basename(d))]

            for file, run_file in product(files, run_files):
                if re.match(run_file, os.path.basename(file)):
                    return os.path.abspath(file)

    def find_bin(self, bin_dirs=['', 'build']):
        executable = stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH

        exclude = set(['\.git', '\.ccls_cache', '\.objs', '.*\.egg-info'])

        for bin_dir in bin_dirs:
            path = os.path.join(self.root, bin_dir)
            for root, dirs, files in os.walk(path):
                [dirs.remove(d) for d in list(dirs)
                        for e in exclude if re.match(e, os.path.basename(d))]
                for file in files:
                    st = os.stat(os.path.join(root, file))
                    mode = st.st_mode
                    if mode & executable:
                        return os.path.join(bin_dir, file)

                # Don't go recursivly deeper to folder structure, check only
                # files and folders in the current folder
                break

    def parse(self, project_files=[], project_dirs=[], run_files=[]):
        self.project_marker = self.__find_project_marker(project_files, project_dirs)

        if self.project_marker is not None:
            self.root = os.path.dirname(self.project_marker)
        else:
            self.root = os.path.dirname(self.current_file)

        if len(run_files) != 0:
            self.run_path = self.__parse_root(run_files)


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument('-f', '--file', type=str)
    args = parser.parse_args()

    return args


if __name__ == '__main__':
    args = parse_args()

    project = Project(args.file)
    project.parse(project_files=['\.cproject', '\.pyproject'],
                  project_dirs=['\.git'])

    exit(project.root)
