#!/usr/bin/perl

#get current time
$timestamp = `date +%s`;
chomp($timestamp);

#get perf data of tsar output
$tsar = `tsar -check`;
@output = split("\t",$tsar,3);

#replace "/" char
$output[2] =~ s/\//_/g;
$output[2] =~ s/\%//g;

print "$timestamp\t$output[2]";