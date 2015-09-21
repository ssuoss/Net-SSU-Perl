package Net::SSU;
use 5.010;
use utf8;
use strict;
use warnings;

use Net::SSU::Context;

use Net::SSU::API::Meal;

use Mouse;

our $VERSION = "0.01";
our @AVAILABLE_APIS = qw/Meal/;

has '_context' => (
    is      => 'ro',
    isa     => 'Net::SSU::Context',
    default => sub { Net::SSU::Context->new }
);

for my $api_name (@AVAILABLE_APIS) {
    my $package = sprintf("Net::SSU::API::%s", $api_name);

    has lc($api_name) => (
        is  => 'ro',
        isa => $package,
        default => sub { 
            $package->new(
                _context => shift->_context
            ) 
        }
    );
}


1;
__END__

=encoding utf-8

=head1 NAME

Net::SSU - ssu.ac.kr API-like wrapper for Perl

=head1 SYNOPSIS

    use Net::SSU;
    
    # Net::SSU 객체 생성
    my $ssu = Net::SSU->new();
    
    # 식단 API
    my $meal_api = $ssu->meal;
    
    # 오늘의 점심은.. 
    my $lunch = $meal_api->lunch;
    

=head1 DESCRIPTION

Net::SSU is ...

=head1 LICENSE

Copyright (C) Gyuhwan Park

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

unstabler E<lt>doping.cheese@gmail.comE<gt>

=cut

