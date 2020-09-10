#!/bin/perl
use strict;
use warnings;

$SIG{TERM} = sub { exit };

my @DIR = grep { -d } glob("*");
foreach my $dir (@DIR) {
	print $dir, "\n";
}

my $parent_pid = "$$";

my @children;
print "Enter string to search: \n";
my $str = <STDIN>;
chomp $str;
foreach my $d (@DIR) {
	my $pid = fork;
	if(!defined $pid) {
		warn "failed to fork: $!";
		kill 'TERM', @children;
		exit;
	}
	elsif($pid) {
		push @children, $pid;
		next;
	}
	print "Searching in subdirectory $d\n";
	system("grep -w $str $d/*");
	print "Finished searching in $d\n";
	exit;
}
wait_children();

sub wait_children {
	while(scalar @children) {
		my $pid = $children[0];
		my $kid = waitpid $pid, 0;
		warn "Reaped $pid ($kid)\n\n";
		shift @children;
	}
}

END {
	if($parent_pid == $$) {
		wait_children();
	}
}
