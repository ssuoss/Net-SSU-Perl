package Net::SSU::Context;
use strict;
use warnings;

use LWP::UserAgent;

use Mouse;

sub DEFAULT_USERAGENT () { 'Mozilla/5.0 (compatible; like MSIE 9.0;) github:ssuoss/Net-SSU-Perl' }

has '_ua' => (
    is  => 'rw',
    isa => 'LWP::UserAgent',
    default => sub { 
        LWP::UserAgent->new( 
            agent => __PACKAGE__->DEFAULT_USERAGENT
        )  
    }
);

sub send_request {
    my $self    = shift;
    my $request = shift;

    return $self->_ua->request($request);
}


1;
