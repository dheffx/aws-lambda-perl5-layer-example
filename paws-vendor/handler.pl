#!perl

use strict;
use warnings;
use utf8;
use Paws;

my $s3 = Paws->service('S3', region => 'us-east-1');

use Data::Dumper;

sub handle {
  my ($event, $context) = @_;

  my $record = $event->{Records}->[0]->{s3};
  my $bucket = $record->{bucket}->{name};
  my $raw_key = $record->{object}->{key};

  print STDERR Dumper($event);
  #$raw_key =~ s/\+/ /g;
  #my $object_key = uri_unescape($raw_key);
  #return "";
  my $res = $s3->GetObject(
    Bucket => 'perl-faas-artifacts',
    Key => 'asdf'
  );
  print STDERR Dumper($res);
  return "";
  # return {
  #   Region => $AWS_REGION,
  #   Bucket => $bucket,
  #   Key => $object_key
  # };

  #   return $obj;
}

1;

