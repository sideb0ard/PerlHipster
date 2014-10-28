#!/usr/bin/perl -w
use strict;
use POSIX;

my @pointz = ([3,4], [7,5], [8,1], [4,2],[1,3], [2,8], [3,9], [6,0]);

my @sortedpointz1 = sortz( 'x', \@pointz );
my @sortedpointz2 = sortz( 'y', \@pointz );

my $minseen;
my @closestpoints;

closestpair(@sortedpointz1);

linearclosestpair(@sortedpointz1);
print "RETUNRNAL\nMinseen = $minseen, with $closestpoints[0][0],$closestpoints[0][1] and $closestpoints[1][0],$closestpoints[1][1]\n";

sub closestpair {
  my @a = @_;
  if ((scalar @a) < 2) {
    return 0;
  } elsif ((scalar @a) == 2) {
    distance(@a);
  }
  my @leftarray = splice @a, 0, floor((scalar @a) /2);
  # recursively call the split
  my @left = closestpair(@leftarray);
  my @right = closestpair(@a);
  # * conquer part!
  #return merge($sortr, \@left,\@right);
}

sub linearclosestpair {
  my @a = @_;
  foreach my $p (@a) {
    foreach my $q (@a) {
      next if $p == $q;
      distance($p,$q);
      #my $qx = @{$q}[0];
      #my $qy = @{$q}[1];
      #my $distance = sqrt(($px - $qx)**2 + ($py - $qy)**2);
      #print "Distance between $px,$py and $qx,$qy - $distance\n";
    }
    print "\n";
  }
}

sub distance {
  my @p = @{$_[0]};
  my @q = @{$_[1]};
  my $px = $p[0];
  my $py = $p[1];
  my $qx = $q[0];
  my $qy = $q[1];
  print "IN DISTANCE with $px, $py, $qx and $qy\n";
  my $distance = sqrt(($px - $qx)**2 + ($py - $qy)**2);
  if (!defined $minseen  || ($distance < $minseen)) {
    $minseen = $distance;
    $closestpoints[0] = [@p];
    $closestpoints[1] = [@q];
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
