#!/usr/bin/perl -w
# ./replicate.pl
# copy files preserving the directory structure (--parents)
# replicateNP.pl  NO PARENTS (--parents doesn't work in Mac OS X ...)

$ddir=$ARGV[0];
while (<STDIN>) {
	/((.)+)/;
	print "cp $1 $ddir\n";	
	system("cp $1 $ddir") == 0
	    or die "copy failed: $?";
	
}
