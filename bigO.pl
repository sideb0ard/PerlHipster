#!/usr/bin/perl -w
use strict;
use POSIX;

my @cleannumz = grep(/^\d+$/, @ARGV);
print "\n::::\nSorting @cleannumz...\n\n";

my $len = scalar @cleannumz;

for (my $i=0; $i < $len; $i++) {
    for (my $j=$i + 1; $j < $len; $j++) {
      if ($cleannumz[$i] == $cleannumz[$j]) {
        print "BOOYA! FOUND DUPE = $cleannumz[$i]\n";
      }
    }
}
