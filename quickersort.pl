#!/usr/bin/perl -w
use strict;
use POSIX;

my @cleannumz = grep(/^\d+$/, @ARGV);
print "\n::::\nSorting @cleannumz...\n\n";

if ((scalar @cleannumz) >= 1) {
  @cleannumz = quicksort( @cleannumz);
  print "\nREZULTS ARE IN: @cleannumz\n\n";
}

sub quicksort {
    my @a = @_;
    return @a if @a < 2;
    my $p = splice @a, int rand @a, 1;
    quicksort(grep $_ < $p, @a), $p, quicksort(grep $_ >= $p, @a);
}
