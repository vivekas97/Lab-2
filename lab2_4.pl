#!/bin/perl
$text = "Hello I am New Hello" ; 
print "$text \n";
@words= split(' ', $text); 
foreach $word(@words)  
{ 
    $count{$word}++; 
}
foreach $word (keys %count)  
{ 
    print $word, " ", $count{$word}, "\n"; 
}