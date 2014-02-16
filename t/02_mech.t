use strict;
use warnings;
use utf8;
use t::Util;
use Plack::Test;
use Plack::Util;
use Test::More;
use Test::Requires 'Test::WWW::Mechanize::PSGI';

my $app = Plack::Util::load_psgi 'script/blog-server';

my $mech = Test::WWW::Mechanize::PSGI->new(app => $app);
$mech->get_ok('/');
$mech->get_ok('/entry', 'Get the newest entry');
#Post a new entry
my $resp = $mech->post('/entry/post');
ok(!$resp->is_success, "Post with no parameter");
$mech->post_ok('/entry/post', ['body' => 'This is a test entry.'], 'Create new entry');
done_testing;
