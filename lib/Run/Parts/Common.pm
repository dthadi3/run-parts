package Run::Parts::Common;

# ABSTRACT: Common helpers for Run::Parts and its backends

use Modern::Perl;
use Exporter::Easy ( EXPORT => [qw[lines chomped_lines]] );
use Scalar::Util qw(blessed);

# VERSION generated by DZP::OurPkgVersion

=encoding utf8

=head1 SYNOPSIS

Exports helper functions used by L<Run::Parts> as well as its backends.

=head1 EXPORTED FUNCTIONS

=head2 lines

Gets an array of strings as parameter.

In scalar context returns a string with all lines concatenated. In
array context it passes through the array.

=cut

sub lines {
    # Sanity check
    die "lines is no method" if blessed $_[0];

    return wantarray ? @_ : join("\n", @_)."\n";
}

=head2 chomped_lines

Gets an array of strings as parameter and calls chomp() on it.

In scalar context returns a string with all lines concatenated. In
array context it passes through the array.

=cut

sub chomped_lines {
    # Sanity check
    die "chomped_lines is no method" if blessed $_[0];

    chomp(@_);
    return lines(@_);
}



=head1 SEE ALSO

L<Run::Parts>


=head1 BUGS

Please report any bugs or feature requests to C<bug-run-parts at
rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Run-Parts>.  I will
be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=cut

1; # End of Run::Parts::Common
