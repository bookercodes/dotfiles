#!/usr/bin/env perl 

## The sink we are interested in should be given as the 
## 1st argument to the script.
my $sink=$ARGV[0] || die("Need a sink number as the first argument\n");

## If the script has been run with a second argument,
## that argument will be the volume threshold we are checking
my $volume_limit=$ARGV[1]||undef;

## Run the pactl command and save the output in 
## ther filehandle $fh
open(my $fh, '-|', 'pactl list sinks');

## Set the record separator to consecutive newlines (same as -000)
## this means we read the info for each sink as a single "line".
$/="\n\n";

## Go through the pactl output
while (<$fh>) {
    ## If this is the sink we are interested in
    if (/#$sink/) {
        ## Extract the current colume of this sink
        /Volume:.*?(\d+)%/;
        my $volume=$1;
        ## If the script has been run with a second argument,
        ## check whether the volume is above or below that
        if ($volume_limit) {
            ## If the volume os greater than or equal to the
            ## value passed, print "y"
            if ($volume >= $volume_limit) {
               print "y\n";
                exit 0;
            }
            else {
                print "n\n";
                exit 1;
            }
        }   
        ## Else, if the script has been run with just one argument,
        ## print the current volume.
        else {
            print "$volume%\n";
        }
    }#
}
