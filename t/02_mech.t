use strict;
use warnings;
use utf8;
use t::Util;
use Plack::Test;
use Plack::Util;
use Test::More;
use Test::Requires 'Test::WWW::Mechanize::PSGI';
use HTTP::Status qw(:constants);
$ENV{AMON2_TESTING} = 1;
my $app = Plack::Util::load_psgi 'script/blog-server';

my $mech = Test::WWW::Mechanize::PSGI->new(app => $app);
$mech->get_ok('/');
$mech->get_ok('/entry', 'Get the newest entry');
#Post a new entry
my $resp = $mech->post('/entry/post');
ok($resp->code == HTTP_BAD_REQUEST , "Post with no parameter");
$mech->post_ok('/entry/post', ['body' => 'This is a test entry.'], 'Create new entry');
done_testing;
