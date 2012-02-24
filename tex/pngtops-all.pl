#!/usr/bin/perl -w
# Converts all the .jpg (or .png) file in the specified directory to PS
# 
# ./pngtops-all.pl [directory] [extension]
#
#
# Requirements:
#  - netpbm package
#
# History:
# 07/08/17 First version (for hamid)
#

$input_dir=".";
if ($ARGV[0]) {
	$input_dir=$ARGV[0];
}
$extension="jpeg";
$conversion="jpegtopnm";
if ($ARGV[1]) {
	$extension=$ARGV[1];
	if ($extension eq "png") {
		$conversion="pngtopnm";
	}
}

$output_dir=$input_dir;

opendir(DIR, $input_dir) || die "can't opendir $input_dir: $!";
@dots = grep {/\d+.$extension/} readdir(DIR);
closedir DIR;


for (@dots) { # default var is $_
  m/(\w+).$extension/;
  my $img=$_;
  
  # convert the image to PNM
  system("$conversion $input_dir/$img >temp.pnm") == 0
         or die "system $conversion failed: $?";

  # convert the output image to PS
  system("pnmtops temp.pnm >$output_dir/$1.ps") == 0
         or die "system pnmtops failed: $?";
  
}

# Erase temporary files
system("rm temp.*");
