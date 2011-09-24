# -*- coding:utf-8; tab-width:4; mode:python -*-

def make_and_clean(desc, dirname):
    Test('make -I $fullbasedir clean all', desc=desc, cwd=dirname, timeout=10)
    Test('make -I $fullbasedir clean', desc=desc, cwd=dirname)
