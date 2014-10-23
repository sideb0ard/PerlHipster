#!/usr/bin/perl -w
use strict;
use POSIX;

my @cleannumz = grep(/^\d+$/, @ARGV);
print "\n::::\nSorting @cleannumz...\n\n";

if ((scalar @cleannumz) > 1) {
  my @results = splitzort(@cleannumz);
  print "REZULTS ARE IN: @results\n\n";
}

sub splitzort {
  my @numz = @_;
  print "MA NUMZ: @numz\n";
  if ((scalar @numz) <= 1) {
    return @numz;
  }
  my @leftarray = splice @numz, 0, floor((scalar @numz) /2);
  # recursively call the split
  my @left = splitzort(@leftarray);
  my @right = splitzort(@numz);
  print "MA lEFT, RIHGT @left, @right\n";
  # * conquer part!
  return merge(\@left,\@right);
}

sub merge (\@\@) {
  my @results;
  my ($left, $right) = @_;
  my @left = @{$left};
  my @right = @{$right};
  while ((scalar @left) > 0 || (scalar @right) > 0) {
    if ((scalar @left) > 0 && (scalar @right) > 0) {
      if (($left[0]) <= ($right[0])) {
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
