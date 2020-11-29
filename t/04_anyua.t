#!perl
use strict;
use warnings;
use utf8;

use Test::More;
use Test::Exception;

use WebService::Slack::WebApi;

subtest 'illegal parameters opt and ua' => sub {

    lives_ok {
        WebService::Slack::WebApi->new( opt => { } )->client;
        WebService::Slack::WebApi->new( ua => (bless {}, 'Obj') )->client;
        WebService::Slack::WebApi->new( )->client;
    } 'Legal parameters';

    throws_ok {
        WebService::Slack::WebApi->new( ua => (bless {}, 'Obj'), opt => { } )->client;
    } 'WebService::Slack::WebApi::Exception::IllegalParameters',
    'Illegal parameters';

    done_testing;
};

done_testing;
