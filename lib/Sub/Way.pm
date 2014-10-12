package Sub::Way;
use strict;
use warnings;
use parent 'Exporter';

our $VERSION = '0.01';

our @EXPORT_OK = qw/ match /;

sub match {
    my ($target, $cond, $and) = @_;

    if ( ref($cond) eq 'ARRAY' ) {
        if ($and) {
            for my $c (@{$cond}) {
                return unless _match($target, $c);
            }
            return 1;
        }
        else {
            for my $c (@{$cond}) {
                return 1 if _match($target, $c);
            }
        }
    }
    else {
        return 1 if _match($target, $cond);
    }

    return; # not match
}

sub _match {
    my ($target, $cond) = @_;

    if ( !ref($cond) || ref($cond) eq 'Regexp' ) {
        return 1 if $target =~ m!$cond!;
    }
    elsif ( ref($cond) eq 'CODE' ) {
        return 1 if $cond->($target); 
    }

    return;
}

1;

__END__

=head1 NAME

Sub::Way - one line description


=head1 SYNOPSIS

    use Sub::Way;


=head1 DESCRIPTION

Sub::Way is


=head1 REPOSITORY

Sub::Way is hosted on github: L<http://github.com/bayashi/Sub-Way>

Welcome your patches and issues :D


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 SEE ALSO

L<Other::Module>


=head1 LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut
