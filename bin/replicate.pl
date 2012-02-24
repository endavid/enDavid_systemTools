#!/usr/bin/perl -w
# ./replicate.pl
# copy files preserving the directory structure (--parents)

$ddir=$ARGV[0];
while (<STDIN>) {
	/((.)+)/;
	print "cp --parents $1 $ddir\n";	
	system("cp --parents $1 $ddir") == 0
	    or die "copy failed: $?";
	
}

#Perl allows you to treat the arguments in @ARGV as filenames, by using the special case of the <> operator. 

#while (<>) {
  # $ARGV is the filename
  # $_ is the line
  # $. is the line number
    # reset it to 0 by doing
    # $. = 0 if eof;
    # or
    # close ARGV if eof;
#}
