#!perl
# -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Differences;

if ($^O ne 'dos' and $^O ne 'os2' and $^O ne 'MSWin32' ) {
    plan skip_all => 'Tests irrelevant on non-dos-ish systems';
} else {
    plan tests => 12;
}

delete $ENV{PATH};

my $runpartsbin = '/bin/run-parts';
my $d = 't/win-dummy';
my @files = qw[bar.com bla.bat foo.exe pfff.scr puff.pif unix.sh];
my @exe_files = qw[bar.com bla.bat foo.exe];

use Run::Parts;

# Testing the perl backend
run_test_on_rp($d, 'perl');

# Testing the automatically chosen backend
run_test_on_rp($d);

sub run_test_on_rp {
    my ($d, $desc) = @_;
    my $rp = Run::Parts->new($d, $desc);

    $desc ||= 'default';

    ok($rp, 'Run::Parts->new($desc) returned non-nil');

    # List files
    eq_or_diff([$rp->list],
               [map { "$d/$_" } @files],
               "Returns list of files in array context ($desc)");

    eq_or_diff(''.$rp->list,
               join('', map { "$d/$_\n" } @files),
               "Returns list of files in string context ($desc)");

    # List executable files
    eq_or_diff([$rp->test],
               [map { "$d/$_" } @exe_files],
               "Returns list of executables in array context ($desc)");
    eq_or_diff(''.$rp->test,
               join('', map { "$d/$_\n" } @exe_files),
               "Returns list of executables in string context ($desc)");

# Seems to fail due to autodie
  TODO: {
      todo_skip("There are no Windows binaries part of the test suite", 1);
      # Skipping is necessary because TODO can't handle modules which
      # use autodie.

      # Executes executable files
      eq_or_diff(''.$rp->run,
                 "TODO",
                 "Returns output of ran executables ($desc)");
    }
}
