# Name

TinyCC - The Tiny C Compiler

# Synopsis

```
    use TinyCC;

    tcc.set(:L<.>).target(:MEM);
    tcc.define(NAME => '"cygx"');

    tcc.compile(q:to/__END__/);
        int puts(const char *);
        int main(void) {
            puts("Hello, " NAME "!");
            return 0;
        }
        __END__

    tcc.run;
    tcc.delete;
```

# Description

Tries to load TinyCC from the shared library specified in `%*ENV<LIBTCC>`,
falling back to `'libtcc'`.

Alternatively, pass a list of potential paths to the use statement:

    use TinyCC <candidate/path/1/libtcc.so candidate/path/2/libtcc.so>;

The current development version of TinyCC itself can be found at
[repo.or.cz/w/tinycc.git](http://repo.or.cz/w/tinycc.git).


# Bugs and Development

Development happens at [GitHub](https://github.com/cygx/tinycc). If you
found a bug or have a feature request, use the issue tracker over there.


# Copyright and License

Copyright (C) 2015 by <cygx@cpan.org>

Distributed under the
[Boost Software License, Version 1.0](http://www.boost.org/LICENSE_1_0.txt)
