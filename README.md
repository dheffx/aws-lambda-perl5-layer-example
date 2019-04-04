aws-lambda-perl5-layer-example
==

This repository shows you a few examples of [aws-lambda-perl5-layer](https://github.com/dheffx/aws-lambda-perl5-layer).

Structure
--

- [hello-world](./hello-world)
  - this shows you how to make the simplest of functions
- [simple-yaml](./simpl-yaml)
  - this shows you how to make a simple Lambda function with package vendoring
- [plack](./plack)
  - this shows you how to make a plack application based Lambda function
- [python-system-perl](./python-system-perl)
  - for the person who says "you don't need layers, its just a container anyway. you can use system perl"
- [s3-upload](./s3-upload)
  - this shows you how to perform an event on upload to an s3 bucket (relies on Paws layer - otherwise add a cpanfile to include Paws)

```yaml
  S3Upload:
    Type: AWS::Serverless::Function
    Properties:
      CodeUri: functions/s3-upload/s3-upload.zip
      Handler: handler.handle
      Runtime: provided
      Timeout: 30
      Layers:
        - !Ref PerlRuntimeLayer
        - !Ref PerlPawsLayer
      Policies:
        - AWSLambdaExecute # AWS Managed
        - Version: '2012-10-17' # Policy to process uploaded files
          Statement:
          - Effect: Allow
            Action:
              - s3:GetObject
              - s3:GetObjectACL
            Resource: arn:aws:s3:::*
          - Effect: Allow
            Action:
              - s3:PutObject
            Resource: arn:aws:s3:::*
      Events:
        FileUploadEvent:
          Type: S3
          Properties:
            Bucket: !Ref UploadBucket
            Events: s3:ObjectCreated:*
            Filter:
              S3Key:
                Rules:
                  - Name: prefix
                    Value: landing/
```

See https://github.com/dheffx/dcbpw-faas-for-perl/lambda for a full SAM template for all functions and layers, as well as command line examples.

License
--

MIT

FORK OF [aws-lambda-perl5-layer](https://github.com/moznion/aws-lambda-perl5-layer).