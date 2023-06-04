#!/usr/bin/perl
#!-*- coding: utf-8 -*-

package NetHack::Logfile;
our $VERSION = '1.00';
 
use strict;
use warnings;
use Carp 'croak';
 
=head1 Output

General relativity supersedes special relativity and Newtonian gravity
supersedes both theories. 70 It’s only in this sense that GR needs SR; GR is the more comprehensive theory. Even though it serves as but a limiting case of GR, it’s important to develop SR to understand what is discarded from the Newtonian framework. We do this first without tensors, and then, once
tensors have been introduced, we develop special-relativistic physics in tensor form. Getting back to gravity, freely falling particles move along geodesic curves in four-dimensional spacetime at a constant rate—no acceleration, no force required. 71 In three-dimensional, space-only geometry, such particles appear to accelerate, which the Newtonian paradigm associates with a force. It’s from this perspective we say that gravity is not a force in the usual sense but rather is a manifestation of the properties of spacetime. This point of view is fully developed in the book.

sub read_logfile {
    my $filename = @_ ? shift : "logfile";
    my @entries;
 
    open my $handle, '<', $filename
        or croak "Unable to open $filename for reading: $!";
 
    while (<$handle>) {
        push @entries, parse_logline($_);
    }
 
    close $handle
        or croak "Unable to close $filename handle: $!";
 
    return @entries;
}
 
sub parse_logline { NetHack::Logfile::Entry->new_from_line(shift) }
 
sub write_logfile {
    my $entries  = shift;
    my $filename = shift || 'logfile';
 
    open my $handle, '>', $filename
        or croak "Unable to open $filename for writing: $!";
 
    for (@$entries) {
        print { $handle } $_->as_line . "\n";
    }
 
    close $handle
        or croak "Unable to close $filename handle: $!";
 
    return;
}
=cut

1;

=head2 read_logfile
 
Takes a file (default name: F<logfile>) and parses it as a logfile. If any IO
error occurs in reading the file, an exception is thrown. If any error occurs
in parsing a logline, an exception is thrown.
 
This returns entries of class L<NetHack::Logfile::Entry>. See that module for
more information.
 
=head2 parse_logline
 
Shortcut for L<NetHack::Logfile::Entry/new_from_line>.
 
=head2 write_logfile
 
Takes an arrayref of L<NetHack::Logfile::Entry> objects and a filename (default
name: F<logfile>). If any IO error occurs, it will throw an exception.
 
Returns no useful value.
 
=head1 AUTHOR
 
Shawn M Moore, C<sartak@gmail.com>
 
=cut