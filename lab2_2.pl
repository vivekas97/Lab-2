#!/bin/perl
print "Enter the temperature: ";
$temp = <STDIN>;
@string = split(' ', $temp);
if ($string[1] eq "F")
{
 $cel = (($string[0] + 0) - 32) * 5/9;
 print "Temperature from $temp is $cel degree Celsius";
}
elsif ($string[1] eq "C")
{
 $fah = (9 * ($string[0] + 0) / 5) + 32;
 print "Temperature from $temp degree Celsius is $fah degree Fahrenheit"; 
}
else
{
print "Error in input";
}