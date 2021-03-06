Simple example of aws-lambda-perl5-layer
==

This example provides a simple example of [aws-lambda-perl5-layer](https://github.com/moznion/aws-lambda-perl5-layer) for building and packing a Lambda function.

This Lambda function receives YAML string, parses that, transform that to JSON and return it.

Example payload:

```
{
  "yaml": "foo: bar"
}
```

Precondition
--

- Register a Lambda handler as `handler.handle`

Sequence
--

1. write a function to `handler.pl`
    - this must have `handle` subroutine
2. arrange the dependency
    - please edit `cpanfile`
3. build it
4. upload the built zip archive

How to build
--

```
$ make build CONTAINER_TAG=x.x
```

`x.x` is the version of the perl runtime (e.g. `5.26`, `5.28`).
You must build it with the same version to the layer's perl version.

How to publish a function
--

```sh
aws --profile "$PROFILE" --region "$REGION" lambda create-function \
        --function-name 'perl-simple' \
        --runtime 'provided' \
        --role "$YOUR_ROLE_ARN" \
        --handler 'handler.handle' \
        --layers "arn:aws:lambda:${REGION}:${AWS_ACCOUNT}:layer:perl-${PERL_VERSION}-layer:1" \
        --zip-file 'fileb://func.zip'
```

[moznion/aws-lambda-perl5-layer](https://github.com/moznion/aws-lambda-perl5-layer) provides pre-built layers: [Using provided layers](https://github.com/moznion/aws-lambda-perl5-layer#1-using-provided-layers)

Under the hood
--

Following processes are executed on the Docker container (Highly recommend: you should use [moznion/lambda-perl-layer-foundation](https://hub.docker.com/r/moznion/lambda-perl-layer-foundation)).

1. build the perl runtime with specified version
2. vendor the dependencies by Carton
3. zip components

See: `build.sh`

LICENSE
--

MIT

