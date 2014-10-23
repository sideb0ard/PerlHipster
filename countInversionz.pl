#!/usr/bin/perl -w
use strict;
use POSIX;

my @cleannumz = grep(/^\d+$/, @ARGV);
print "\n::::\nSorting @cleannumz...\n\n";

my $inversionCount = 0;

if ((scalar @cleannumz) > 1) {
  my @results = countsort(@cleannumz);
  print "REZULTS ARE IN: @results\n\n";
  print "COUNT OF SPLIT INDICES IS $inversionCount\n";
}

sub countsort {
  my @numz = @_;
  print "MA NUMZ: @numz\n";
  if ((scalar @numz) <= 1) {
    #print "LAST ONE _ RETURNING NUMZ: @numz\n";
    return (@numz);
  }
  #print "FULL ARRAY @numz CUN\n";
  my @leftarray = splice @numz, 0, floor((scalar @numz) /2);
  #print "LEFT ARRAY @leftarray CUN\n";
  #print "REMAINING ARRAY @numz CUN\n";
  # recursively call the split
  my @left = countsort(@leftarray);
  my @right = countsort(@numz);
  # * conquer part!
  #print "CUNNTY @left and @right\n";
  return countSplitInv(\@left,\@right);
}

sub countSplitInv {
  my @left = @{$_[0]};
  my @right = @{$_[1]};

  #print "LEFT is @left AND RIGHT is @right\n";
  my @results;
  my $results_length = (scalar @left) + ( scalar @right);
  #print "RESULTSLENGCUN: $results_length\n";
  my ($i, $j, $k ) = (0,0,0);
  #print "left @left \n";
  for ( ; $k < $results_length; $k++) {#
    #print "K $k\n";
    #print "I $i // J $j\n";
    if ($i < (scalar @left) && $j < (scalar @right)) {
     #print "SCALAY " . (scalar @left) . " AND RIGHT " . (scalar @right) . "\n";
      #print "LEFT VAL: $left[$i] and RIGHT VAL $right[$j]\n";
      if ($left[$i] < $right[$j]) {
        push @results, $left[$i];
        $i++;
        #print "I iz $i\n";
      } else {
        push @results, $right[$j];
        $j++;
        #print "CUR POSZ: $results[$k]\n";
        if ($i < (scalar @left)) {
          if ($results[$k] < $left[$i]) {
            my $x = (scalar @left) - $i;
            print "BOOY YA $results[$k] < $left[$i] -- there are $x spaces still in LEFT\n";
            $inversionCount+= $x
          }
        }
      }
    } elsif ($i < (scalar @left)) {
        push @results, $left[$i];
        $i++;
    } else {
        push @results, $right[$j];
        $j++;
    }
  }
  print "RESULTS @results\n";
  return (@results);
}
