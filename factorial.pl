#!/usr/bin/perl -w
use strict;

my $num = $ARGV[0] || die "Doh!\n";
my $f = fact($num);
print "Factorial of $num is $f\n";

sub fact {
  my $n = shift;
  if ($n == 1 || $n == 0) { return 1;
  } else {return $n * fact($n - 1); }
}

