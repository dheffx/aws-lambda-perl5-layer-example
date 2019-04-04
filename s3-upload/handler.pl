#!perl

use strict;
use warnings;
use utf8;
use Paws;

$ENV{'PAWS_SILENCE_UNSTABLE_WARNINGS'} = 1;

my $s3 = Paws->service('S3', region => $ENV{AWS_REGION} // 'us-east-2');
my $source_key_prefix = 'landing/';
my $dest_key_prefix = 'processed/';

=pod

=head1 handle

Receive an event from an S3 upload

Retrieve the object, alter the contents,
and upload back to s3 in a processed path

=cut

sub handle {
  my ($event, $context) = @_;

  my $record = $event->{Records}->[0]->{s3};
  my $bucket = $record->{bucket}->{name};
  my $source_key = $record->{object}->{key};
  
  my $key = substr($source_key, length($source_key_prefix));
  my $dest_key = "$dest_key_prefix$key";
  
  print STDERR "Processing upload to $bucket: $source_key | $key\n";
  
  my $get_result = $s3->GetObject(
    Bucket => $bucket,
    Key => $source_key
  );
  
  print STDERR "Received:\n$get_result->{Body}";
  
  my $processed_data = $get_result->{Body} . "\nprocessed by Perl FaaS!";
  my $put_result = $s3->PutObject(
    Bucket => $bucket,
    Key => $dest_key,
    Body => $processed_data
  );
  
  return { "Key" => $dest_key };
}

1;

