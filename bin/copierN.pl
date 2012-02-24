#!/usr/bin/perl -w
# ./copierN.pl ../randomSelection/ <random03.txt 
# Copies all the files listed in STDIN to the destination folder, renaming to numbers

$dest = $ARGV[0];

$n=0;
while(<STDIN>){
	m/.+\.(.+)/;
	$file = $_;
	chomp($file); #remove EOL char
	#print "cp $file $dest\n";
	$name="$n";
	if ($n<10) {$name="0$name";}
	if ($n<100) {$name="0$name";}
	if ($n<1000) {$name="0$name";}
	if ($n<10000) {$name="0$name";}
	
	system("cp -v $file $dest/$name.$1") == 0
       or die "copy failed: $?";
    $n++;
}