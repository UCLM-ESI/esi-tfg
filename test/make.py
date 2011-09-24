# -*- coding:utf-8; tab-width:4; mode:python -*-

def make_and_clean(desc, dirname):
    Test('make -I $basedir/make clean all', desc=desc, cwd=dirname)
    Test('make -I $basedir/make clean', desc=desc, cwd=dirname)
