#!/usr/bin/env perl6

use v6;

use TinyCC;

say '1..1';

tcc.setroot(%*ENV<TCCROOT>)
    if %*ENV<TCCROOT>:exists;

tcc.define(NAME => '"cygx"');
tcc.compile(q:to/__END__/);
    int puts(const char *);
    int main(void) {
        puts("ok 1 -- Hello, " NAME "!");
        return 0;
    }
    __END__

tcc.run;
tcc.delete;
