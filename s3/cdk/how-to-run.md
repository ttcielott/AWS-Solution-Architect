# How to Run CDK for S3 bucket creation

## Implementation

1. Move to this folder

```cmd
cd s3/cdk
```

2. Run Init

```cmd
cdk init sample-app --language=typescript
```

3. Install packages

```cmd
npm i
```

4. Run bootstrap
In AWS CDK (Cloud Development Kit), "cdk bootstrap" is a command used to set up the initial infrastructure needed by the CDK toolkit in your AWS account. This infrastructure includes resources like an Amazon S3 bucket for storing files and IAM roles that grant permissions required to deploy resources.

```cmd
cdk bootstrap

5. Deploy

```
cdk deploy
```