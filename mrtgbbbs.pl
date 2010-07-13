#!/usr/bin/perl -w

# mrtgbbbs.pl
#
# version 1.2 
# Copyright (c) 2000-2004 Robert James Clay.  All Rights Reserved.
# This is free software;  you can redistribute it and/or
# modify it under the same terms as Perl itself.


use IO::Socket;

#$DEBUG = 0;

if ($ARGV[0]) {
   $host = $ARGV[0] ;
   $type = $ARGV[1] ;
} else {
   print STDERR "Usage: $0 <hostname> <io|user>\n" ;
   exit 1 ;
}
#
$socket = IO::Socket::INET->new
(
    PeerAddr => $host,
    PeerPort => 16425,  # standard BBBS port
    Proto    => "tcp",
    Type     => SOCK_STREAM
) or die "Could not open port.\n";

print $socket "$type\n";

$first = <$socket>;
$second = <$socket>;
$time = <$socket>;

close($socket);
 
print "$first";
print "$second";
print "$time\n";

print "";

exit; # We're done!

