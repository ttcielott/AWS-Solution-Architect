# How to Run CDK for S3 bucket creation

## Implementation

1. Move to this folder

```sh
cd s3/cdk
```

2. Run Init

```sh
cdk init sample-app --language=typescript
```

3. Install packages

```sh
npm i
```

4. Run bootstrap
In AWS CDK (Cloud Development Kit), "cdk bootstrap" is a command used to set up the initial infrastructure needed by the CDK toolkit in your AWS account. This infrastructure includes resources like an Amazon S3 bucket for storing files and IAM roles that grant permissions required to deploy resources.

```sh
cdk bootstrap

5. Deploy

```sh
cdk deploy
```

## Clean up

1. Delete CDKStack

```sh
cdk destroy
```

2. Delete 'CDKToolkit' stack created by bootstrap

```sh
aws cloudformation delete-stack --stack-name CDKToolkit
```

3. Delete bucket left in s3

```sh
aws s3 rm s3://$cdkbucket --recursive
```

```sh
cdkbucket=$(aws s3 ls | grep cdk- | awk '{printf $3}')
```

delete all versions

```sh
aws s3api delete-objects --bucket $cdkbucket --delete "$(aws s3api list-object-versions --bucket $cdkbucket | jq '{Objects: [.Versions[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
```

```sh
aws s3api delete-objects --bucket $cdkbucket --delete "$(aws s3api list-object-versions --bucket $cdkbucket | jq '{Objects: [.DeleteMarkers[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
```

```sh
aws s3 rb s3://$cdkbucket
```