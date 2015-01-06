#!/usr/bin/perl 
# Filename : client.pl

use strict;
use Socket;

# initialize host and port
my $host = shift || 'localhost';
my $port = shift || 7890;
my $server = "localhost";  # Host IP running the server

# create the socket, connect to the port
socket(SOCKET,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2])
   or die "Can't create a socket $!\n";
connect( SOCKET, pack_sockaddr_in($port, inet_aton($server)))
   or die "Can't connect to port $port! \n";

my $line = <>;
send (SOCKET, $line, 0);
#print SOCKET "$line\n";
#system "lsof -nP | grep $port";
#sleep 10;
my $line1;
recv (SOCKET, $line1, 255, 0); 
print $line1;
close SOCKET or die "close: $!";


