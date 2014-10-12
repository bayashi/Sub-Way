use strict;
use warnings;
use Test::More;

use Sub::Way qw/match/;

{
    ok match('hoge', 'og');
    ok match('hoge', qr/og/);
    ok match('hoge', ['og']);
    ok match('hoge', [qr/og/]);
    ok match('hoge', ['go', 'og']);
    ok match('hoge', [qr/go/, qr/og/]);
    ok match('hoge', ['og', qr/og/]);
    ok match('hoge', sub { my $text = shift; return 1 if $text =~ m!^h!; });
}

done_testing;
