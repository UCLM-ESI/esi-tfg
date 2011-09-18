# -*- coding:utf-8; tab-width:4; mode:python -*-

def make_and_clean(desc, dirname):
    Test('make clean all', desc=desc, cwd=dirname)
    Test('make clean', desc=desc, cwd=dirname)
