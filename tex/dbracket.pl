#!/usr/bin/perl -w
# Extracts a value between brackets { }
# Examples:
#   ./dbracket.pl <contourcount.sketch.txt
#
#  - Extracts the list of figures from a tex file:
#   grep includegraphics coe21-david.tex | ./dbracket.pl


while(<STDIN>){
	if (/\{((.)+)\}/) {
		print "$1 \n";
	}
}
