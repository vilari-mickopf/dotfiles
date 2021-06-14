#! /usr/bin/env python

import os


def parse_c(project):
    project.parse(project_files=['\.cproject'], project_dirs=['\.git'],
                  run_files=['[Mm]akefile'])


def run_c(project):
    if os.path.isfile(os.path.join(project.root, 'CMakeLists.txt')):
        build_dir = os.path.join(project.root, 'build')
        if 'clean' in project.args:
            exit('rm -rfv ' + build_dir)

        cmd = 'cd ' + build_dir + ' && '
        if not os.path.isfile(os.path.join(build_dir, 'Makefile')):
            if not os.path.isdir(build_dir):
                os.mkdir(build_dir)
            cmd += 'cmake .. -Wno-dev -Wno-deprecated' + ' '.join(project.args) + ' && '

        if os.path.isfile(os.path.join(build_dir, 'ninja.build')):
            cmd += 'ninja'
        else:
            cmd += 'make -j$(nproc)'
        exit(cmd)
    else:
        if project.run_path is None:
            template_path = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                         'MakefileTemplate')
            os.system('cp ' + template_path + ' ' +
                              os.path.join(project.root, 'Makefile'))
            cmd = 'cd ' + project.root + ' && '
        else:
            cmd = 'cd ' + os.path.dirname(project.run_path) + ' && '

        if len(project.args) == 0:
            project.args = ['all']

        cmd += 'make -j$(nproc) ' + ' '.join(project.args)
        exit(cmd)
