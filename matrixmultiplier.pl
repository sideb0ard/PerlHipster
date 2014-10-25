#!/usr/bin/perl -w
use strict;

#a b   x    e f
#c d   x    g h
# =
#ae+bg  af+bh
#ce+dg  cf+dh
#

# 2 5   x    5 7
# 5 6   x    8 13
#
# 0,0 0,1   0,0 0,1
# 1,0 1,1   1,0 1,1
#
# 00 = a[00]*b[00] + a[01]*b[10]
# 01 = a[00]*b[01] + a[01]*b[11]
# 10 = a[10]*b[00] + a[11]*b[10]
# 11 = a[10]*b[01] + a[11]*b[11]
#
# 10+40(50)   14+65(79)
# 25+48(73)   35+78(113)


my %matrixone = (
  '00' => 2,
  '01' => 5,
  '10' => 5,
  '11' => 6,
);

my %matrixtwo = (
  '00' => 5,
  '01' => 7,
  '10' => 8,
  '11' => 13,
);

my $matrixlen = (keys %matrixone) / 2;

#print "MATRIXLEN = $matrixlen\n";

my %resultMatrix = ();
for (my $i = 0; $i < $matrixlen; $i++) {
  for (my $j = 0; $j < $matrixlen; $j++) {
    my $currentKey = "$i" . "$j";
    #print "MATRXIRESULTKEY: $currentKey\n";
    my $tally;
    for (my $ii = 0; $ii < $matrixlen; $ii++) {
      my $curri = "$i" . "$ii";
      #print "CURK1 : $curri\n";
      my $currj = "$ii" . "$j";
      #print "CURK2 : $currj\n";
      $tally += $matrixone{$curri} * $matrixtwo{$currj};
      #print "tally = $tally\n";
      #print "$matrixone{$currk}\n";
    }
    #print "tally = $tally\n";
    $resultMatrix{ $currentKey } = $tally;
  }
}

foreach my $k (sort keys %resultMatrix) {
  print "$k -> $resultMatrix{$k}\n";
}
