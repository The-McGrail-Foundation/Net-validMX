#!/usr/bin/perl -w 

BEGIN {
  unshift (@INC, "lib");
}

use Net::validMX;
use strict;

print "DEBUG: Net::validMX::version: ".&Net::validMX::version()."\n\n";

my ($rv, $reason, $valid);

$valid = Net::validMX->new(allow_ip_address_as_mx=>0, debug=>1);

#FEEL FREE TO OVERRIDE SETTINGS PER FUNCTION AS WELL
($rv, $reason) = $valid->check_valid_mx(email=>'kevin@mcgrail.com', debug=>1, allow_ip_address_as_mx=>0);

print "DEBUG: rv/reason: $rv - $reason\n";

#PROCEDURAL METHOD

print "\nProdecural\n";

$Net::validMX::ALLOW_IP_ADDRESS_AS_MX = 0;
$Net::validMX::DEBUG = 0;

($rv, $reason) = &Net::validMX::check_valid_mx(email=>'kevin@mcgrail.com', debug=>1, allow_ip_address_as_mx=>1);

print "DEBUG: rv/reason: $rv - $reason\n";

($rv, $reason) = &Net::validMX::check_valid_mx('kevin@mcgrail.com', debug=>0);

print "DEBUG: rv/reason: $rv - $reason\n";

#allow_ip_address_as_mx
