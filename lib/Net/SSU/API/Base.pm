package Net::SSU::API::Base;
use utf8;
use strict;

use HTTP::Request::Common qw//; # Exporter 무시

use Mouse::Role;

sub GET    () { 'GET'    }
sub POST   () { 'POST'   }
sub PUT    () { 'PUT'    }
sub DELETE () { 'DELETE' }

has '_context' => ( 
    is       => 'ro',
    isa      => 'Net::SSU::Context',
    required => 1
);

sub _request {
    my $self = shift;

    return $self->_send_request(
        $self->_build_request(@_)
    );
}

sub _build_request {
    my $self = shift;
    my ($method, $url, @param) = @_;
    $method = uc($method);

    return HTTP::Request::Common::_simple_req($method, $url, @param);
}

sub _send_request {
    my $self    = shift;   
    my $request = shift;

    my $response = $self->_context->send_request($request);

    unless ($response->is_success) {
        warn sprintf "[warn] HTTP Request failed (%d): %s %s", 
            $response->code, $request->method, $request->uri;
    }

    return $response;
}

1;

=encoding utf-8

=head1 NAME

Net::SSU::API::Base - Base Class of ssu.ac.kr API-like Interface


