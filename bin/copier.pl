#!/usr/bin/perl -w
# ./copier.pl ../randomSelection/ <random03.txt 
# Copies all the files listed in STDIN to the destination folder

$dest = $ARGV[0];

while(<STDIN>){
	$file = $_;
	chomp($file); #remove EOL char
	#print "cp $file $dest\n";
	system("cp -v $file $dest") == 0
       or die "copy failed: $?";
}