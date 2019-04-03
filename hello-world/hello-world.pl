use strict;
use warnings;

sub handler {
  my ($event) = @_;
  return { message => "hello world" };
}

1;