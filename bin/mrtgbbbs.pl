#!/usr/bin/perl

# mrtgbbbs.pl
#
# Copyright (c) 2000-2011 Robert James Clay.  All Rights Reserved.
# This is free software;  you can redistribute it and/or
# modify it under the same terms as Perl itself.

use warnings;
use strict;
use IO::Socket;

our $VERSION = 1.3;

my ($host, $type, $socket, $first, $second, $time );

#my $DEBUG = 0;

if ( $ARGV[0] ) {
    $host = $ARGV[0];
    $type = $ARGV[1];
}
else {
    print {*STDERR} "Usage: $0 <hostname> <io|user>\n";
    exit 1;
}

#
$socket = IO::Socket::INET->new(
    PeerAddr => $host,
    PeerPort => 16_425,        # standard BBBS port
    Proto    => 'tcp',
    Type     => SOCK_STREAM
) or die "Could not open port.\n";

print {$socket} "$type\n";

$first  = <$socket>;
$second = <$socket>;
$time   = <$socket>;

close $socket or die "Unable to close socket.\n";

print "$first";
print "$second";
print "$time\n";

print q{};

exit;    # We're done!
