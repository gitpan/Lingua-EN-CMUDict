# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Lingua-EN-CMUDict.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';
use strict;
use warnings;

use Test::More tests => 8;
BEGIN { use_ok('Lingua::EN::CMUDict') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $obj = Lingua::EN::CMUDict->new(cmufile=>'./share/cmusyldict.db');
ok(defined $obj && $obj->isa('Lingua::EN::CMUDict'));
ok($obj->number_of_syllables("bird") eq 1);
ok($obj->number_of_syllables("birds") eq 1);
my @res = $obj->rhymes("bird");
ok(scalar(@res) > 0);
my $rhyme = $obj->rhymes("late");
ok(defined $rhyme);
ok(defined $obj->get_word("chocolate"));
ok($obj->number_of_syllables("the pie in the sky") eq 5);
