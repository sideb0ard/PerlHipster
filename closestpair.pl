#!/usr/bin/perl -w
use strict;
use POSIX;

my @pointz = ([3,4], [7,5], [8,1], [4,2],[1,3], [2,8], [3,9], [6,0]);

my @sortedpointz1 = sortz( 'x', \@pointz );
my @sortedpointz2 = sortz( 'y', \@pointz );

my $minseen;

closestpair(@sortedpointz1);

sub closestpair {
  my @a = @_;
  foreach my $p (@a) {
    my $px = @{$p}[0];
    my $py = @{$p}[1];
    foreach my $q (@sortedpointz1) {
      next if $p == $q;
      my $qx = @{$q}[0];
      my $qy = @{$q}[1];
      my $distance = sqrt(($px - $qx)**2 + ($py - $qy)**2);
      print "Distance between $px,$py and $qx,$qy - $distance\n";
    }
    print "\n";
  }
}

sub sortz {
  my $sortr = shift;
  my $numzref = shift;
  my @numz = @{$numzref};
  if ((scalar @numz) <= 1) {
    return @numz;
  }
  my @leftarray = splice @numz, 0, floor((scalar @numz) /2);
  # recursively call the split
  my @left = sortz($sortr, \@leftarray);
  my @right = sortz($sortr, \@numz);
  # * conquer part!
  return merge($sortr, \@left,\@right);
}

sub merge (\@\@) {
  my @results;
  my ($sortr, $left, $right) = @_;
  my @left = @{$left};
  my @right = @{$right};
  my $sf = (($sortr eq 'x') ? 0 : 1); # SF = sort field - i.e. x or y co-ord
  while ((scalar @left) > 0 || (scalar @right) > 0) {
    if ((scalar @left) > 0 && (scalar @right) > 0) {
      if (($left[0][$sf]) <= ($right[0][$sf])) {
        push @results, shift @left;
      } else {
        push @results, shift @right;
      }
    } elsif ((scalar @left) > 0 ) {
      push @results, shift @left;
    } else {
      push @results, shift @right;
    }
  }
  return @results;
}
