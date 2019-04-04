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
- [s3-upload](./s3-upload)
  - this shows you how to perform an event on upload to an s3 bucket (relies on Paws layer - otherwise add a cpanfile to include Paws)
- [python-system-perl](./python-system-perl)
  - for the person who says "you don't need layers, its just a container anyway. you can use system perl"

License
--

MIT



FORK OF [aws-lambda-perl5-layer](https://github.com/moznion/aws-lambda-perl5-layer).