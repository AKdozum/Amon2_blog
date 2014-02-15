use strict;
use warnings;
use Test::More;


use blog;
use blog::Web;
use blog::Web::View;
use blog::Web::ViewFunctions;

use blog::DB::Schema;
use blog::Web::Dispatcher;


pass "All modules can load.";

done_testing;
