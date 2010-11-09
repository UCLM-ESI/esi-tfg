// -*- mode:c++ -*-

#include <stdio.h>

#include <liba/a.h>
#include <libb/b.h>

#include "ce.h"

int c(int v) {
	a(4);
	b(4);
	printf("%d\n", v+20);
}
