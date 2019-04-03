use strict;
use warnings;
use utf8;
use Plack::Request;
use Plack::Builder;
use Data::Dumper;

return builder {
    mount '/' => sub {
        my $env = shift;
        return {
          statusCode => 200,
          body => "plack says hello",
          'Content-Type' => 'text/plain',
        };
    };
};

