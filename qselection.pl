#!/usr/bin/perl -w
use strict;
use POSIX;

my @cleannumz = (43, 7, 5, 3, 21, 898);
my $ith = 4; # should 21 - the fourth element value from sorted list

print "Starting with @cleannumz\n";
my @newarray = pivot(@cleannumz);
print "NEWZ @newarray\n";

sub pivot {
  my @a = @_;
  my $pivotIndex = int(rand(scalar @a));
  #my $pivotIndex = 0;
  my $pivot = $a[$pivotIndex];
  # move Pivot to first/leftmost place..
  print "Pivot index is $pivotIndex - value $pivot\n";
  my $tempHolder = $a[0];
  $a[0] = $pivot;
  $a[$pivotIndex] = $tempHolder;
  # advance pointers as pivot is in first place..
  my $i = 1;
  my $j = 1;
  for ( ; $j < (scalar @a); $j++) {
    print "A[j] is $a[$j] and pivot is $pivot\n";
    if ($a[$j] < $pivot) {
      $tempHolder = $a[$i];
      $a[$i] = $a[$j];
      $a[$j] = $tempHolder;
      $i++;
    }
  }
  # move pivot back into proper place
  $tempHolder = $a[$i - 1];
  $a[$i - 1] = $a[0];
  $a[0] = $tempHolder;
  return @a;
}

