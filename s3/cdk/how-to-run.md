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

```cmd
cdk deploy
```

## Clean up

1. Delete CDKStack

```cmd
cdk destroy
```

2. Delete 'CDKToolkit' stack created by bootstrap

```cmd
aws cloudformation delete-stack --stack-name CDKToolkit
```

3. Delete bucket left in s3

```cmd
aws s3 rm s3://$cdkbucket --recursive
```

```cmd
cdkbucket=$(aws s3 ls | grep cdk- | awk '{printf $3}')
```

delete all versions

```cmd
aws s3api delete-objects --bucket $cdkbucket --delete "$(aws s3api list-object-versions --bucket $cdkbucket | jq '{Objects: [.Versions[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
```

```cmd
aws s3api delete-objects --bucket $cdkbucket --delete "$(aws s3api list-object-versions --bucket $cdkbucket | jq '{Objects: [.DeleteMarkers[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
```

```cmd
aws s3 rb s3://$cdkbucket
```