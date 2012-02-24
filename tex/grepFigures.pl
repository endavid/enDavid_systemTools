#!/usr/bin/perl -w
# Extracts \begin{figure} environments
# Examples:
#   grepFigures.pl <master.tex >figures.tex
#   cat *.tex | grepFigures.pl
#
# Add \clearpage manually:
#   http://www-oss.fnal.gov/~mengel/How_To/node9.html

$inside=0;
$nfigs=0;
while(<STDIN>){
	if (/\\begin\{figure\}/) {
	   $inside=1;
	   #print "$_";
	   $nfigs++;
	   print "\n\n\n% --------------------------- Figure $nfigs ----------------------------\n";
	}
	if ($inside) {
	    print "$_";
	}
	if (/\\end\{figure\}/) {
	   $inside=0;
	   #print "$_";
	}
}
