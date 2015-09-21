# NAME

Net::SSU - ssu.ac.kr API-like wrapper for Perl

# SYNOPSIS

    use Net::SSU;
    
    # Net::SSU 객체 생성
    my $ssu = Net::SSU->new();
    
    # 식단 API
    my $meal_api = $ssu->meal;
    
    # 오늘의 점심은.. 
    my $lunch = $meal_api->lunch;
    

# DESCRIPTION

Net::SSU is ...

# LICENSE

Copyright (C) Gyuhwan Park

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

unstabler <doping.cheese@gmail.com>
