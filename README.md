<!--
title: 'AWS NodeJS Example'
description: 'This template demonstrates how to deploy a NodeJS function running on AWS Lambda using the traditional Serverless Framework.'
layout: Doc
framework: v3
platform: AWS
language: nodeJS
priority: 1
authorLink: 'https://github.com/serverless'
authorName: 'Serverless, inc.'
authorAvatar: 'https://avatars1.githubusercontent.com/u/13742415?s=200&v=4'
-->


# Serverless Framework AWS NodeJS Example

To get private key:
```sh
aws ec2 describe-key-pairs --filters Name=key-name,Values=mcserver --query KeyPairs[*].KeyPairId --output text
```
```sh
aws ssm get-parameter --name /ec2/keypair/<key_id> --with-decryption --query Parameter.Value --output text > mcserver.pem
```
