#!perl -T

use strict;
use warnings;
use 5.010;

use Test::More;

my $min_tcm = 0.9;
eval {use Test::CheckManifest $min_tcm};
plan skip_all => "Test::CheckManifest $min_tcm required" if $@;

ok_manifest();
