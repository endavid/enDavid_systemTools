#!/usr/bin/env ruby

# A small Ruby script to create numbered copies of the same file
# This could be probably done faster with shell script, but 
# I wanted to learn some ruby, plus I can add extra checks more easily in Ruby
#
# In shell script it would be something like this:
#   for i in `seq 1 10`; do echo "cp myFile myFile_$i"; done

require "fileutils"

def clonecp(filename, num_copies = 2)
    splitted = filename.split('.')
    name = splitted[0]
    ext = splitted.length > 1 ? ".#{splitted.last}" : ""
    if splitted.length > 2
        name = splitted[0..(splitted.length - 2)].join('.')
    end
    num_copies.times do |i|
        FileUtils.cp "#{filename}", "#{name}_#{i}#{ext}", :verbose => true
    end 
end

# This code will execute in standalone mode :)
if __FILE__ == $0
    if !ARGV[1].nil?
        clonecp ARGV[0], ARGV[1]
    elsif !ARGV[0].nil?
        clonecp ARGV[0]
    else
        puts "#{__FILE__} filename [num_copies]"
    end
end
