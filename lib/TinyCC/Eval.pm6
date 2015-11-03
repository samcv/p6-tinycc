# Copyright 2015 cygx <cygx@cpan.org>
# Distributed under the Boost Software License, Version 1.0

use TinyCC;
use NativeCall;

multi EVAL(Cool $code, Str() :$lang! where 'c'|'C', :&init, :$args) is export {
    my \tcc = TinyCC.new;
    my $error;
    tcc.catch(-> Pointer, Str $msg { $error = X::AdHoc.new(payload => $msg) });
    .(tcc) with &init;
    tcc.compile(~$code);
    do {
        CATCH { ($error // $_).fail }
        tcc.run: @($args // ());
    }
}
