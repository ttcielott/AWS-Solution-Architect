# ACLs (Access Control Lists)

- ACLs grant basic read/write permissions to other AWS accounts.
- It's a legacy feature of S3 and there are more robust way to provide crosss-account access via bucket policies and access points.

## Create a bucket

```sh
aws s3 mb s3://acls-fun-ab-123
```

## Turn off Block Public Access for ACLs

```sh
aws s3api put-public-access-block --bucket acls-fun-ab-123 --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true 
```

```sh
aws s3api get-public-access-block --bucket acls-fun-ab-123
```

## Change Bucket Ownership

```sh
aws s3api put-bucket-ownership-controls --bucket acls-fun-ab-123 --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

Now, you can see in the console 'Edit access control list' enabled.

## Change ACLs to allow for a user in another AWS Account


```sh
aws s3api put-bucket-acl \
--bucket acls-fun-ab-123 \
--access-control-policy file:////{ policy.json file path }
```

[json format](https://docs.aws.amazon.com/cli/latest/reference/s3api/put-bucket-acl.html)