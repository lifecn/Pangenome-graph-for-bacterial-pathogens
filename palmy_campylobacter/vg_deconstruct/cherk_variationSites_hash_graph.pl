#!/usr/bin/perl
use strict;
use warnings;

my @line1;
my @line2;
my @sub_line2;

my %hash;
my $key_ref;
my $key_src;

open FILE1,"$ARGV[0]"
    or die "Could not open file $ARGV[0]";
open FILE2,"$ARGV[1]"
    or die "Could not open file $ARGV[1]";

my @linelist=<FILE2>;

foreach my $eachline (@linelist)
{
    chomp $eachline;
    @line2 = split /\s+/, $eachline;
	my $key_ref = defined($line2[1]) ? $line2[1] : "udef"; 
    $hash{$key_ref} = $eachline;
}

while (<FILE1>)
{
    chomp;
    @line1 = split /\s+/;
	my $key_src = defined($line1[2]) ? $line1[2] : "udef"; 
    if (exists $hash{$key_src})
    {
        push(@line1, "1");
    }
    else
    {
        push(@line1, "0");
    }
    print "@line1\n";
}
close FILE1;
close FILE2;

