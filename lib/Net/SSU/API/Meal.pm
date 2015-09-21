package Net::SSU::API::Meal;
use utf8;
use strict;
use warnings;

use Mouse;

with 'Net::SSU::API::Base';

sub URL_MEAL_MENULIST () { 'http://m.ssu.ac.kr/html/themes/m/html/etc_menulist.jsp' }

sub TYPE_BREAKFAST () { '조식' }
sub TYPE_LUNCH     () { '중식' }
sub TYPE_DINNER    () { '석식' }

has 'cached_menu_list' => (
    is  => 'rw',
    isa => 'ArrayRef'
);

sub _parse_menu {
    my $self     = shift;
    my $raw_html = shift;
}

1;

=encoding utf-8

=head1 NAME

Net::SSU::API::Meal

=head1 METHODS



