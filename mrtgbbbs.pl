#!/usr/bin/perl -w

# mrtgbbbs.pl
#
# version 1.0  - 13 May 2000 - R.J. Clay

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

