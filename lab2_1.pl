#!/bin/perl
$filename = "lab2_2.pl";
@string = split('\.', $filename);
print "$filename \n";
$count = 0;
if ($string[-1] eq "pl" || $string[-1] eq "pm")
{
	$count++;
}
if (-e $filename && -r $filename)
{
    $count++;
}
if (-z $filename)
{
	print "File empty";
}
else
{
$count++;
}
if ( $count == 3)
{
print "Valid Perl File";
}
if ( $count !=3 )
{
print "Error: unable to analyse the specified file";
}
