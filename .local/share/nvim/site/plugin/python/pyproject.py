#! /usr/bin/env python

import os


def parse_py(project):
    project.parse(project_files=['\.pyproject'], project_dirs=['\.git'])


def run_py(project):
    if project.run_path is None:
         run_path = project.current_file
    else:
         run_path = project.run_path

    cmd = ('cd ' + os.path.dirname(run_path) + ' && ' +
           'python ' + os.path.basename(run_path))

    if project.args != []:
        cmd+= ' ' + ' '.join(project.args)

    for post in project.post:
        cmd += ';' + post

    exit(cmd)
