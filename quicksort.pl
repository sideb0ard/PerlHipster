#!/usr/bin/perl -w
use strict;
use POSIX;

my @cleannumz = grep(/^\d+$/, @ARGV);
print "\n::::\nSorting @cleannumz...\n\n";

if ((scalar @cleannumz) >= 1) {
  quicksort(0,(scalar @cleannumz) - 1);
  print "\nREZULTS ARE IN: @cleannumz\n\n";
}

#take array and select random element - thats the pivot
# walk the array and if current element is less than
#

sub quicksort {
  my $l = shift;
  my $r = shift;
  print "L is $l, R is $r\n";
  if ($l < $r) {
    my $pivotIndex = int(rand($r - $l) + $l);
    #my $pivotIndex = 0;
    my $pivot = $cleannumz[$pivotIndex];
    # move Pivot to first/leftmost place..
    my $tempHolder = $cleannumz[$l];
    $cleannumz[$l] = $pivot;
    $cleannumz[$pivotIndex] = $tempHolder;
    # advance pointers as pivot is in first place..
    my $i = $l + 1;
    my $j = $l + 1;
    for ( ; $j <= $r; $j++) {
      if ($cleannumz[$j] < $pivot) {
        $tempHolder = $cleannumz[$i];
        $cleannumz[$i] = $cleannumz[$j];
        $cleannumz[$j] = $tempHolder;
        $i++;
      }
    }
    # move pivot back into proper place
    $tempHolder = $cleannumz[$i - 1];
    $cleannumz[$i - 1] = $cleannumz[$l];
    $cleannumz[$l] = $tempHolder;

    quicksort($l,$i - 1);
    quicksort($i , $r);
  }
}

