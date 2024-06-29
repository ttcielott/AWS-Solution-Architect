# Apply a Bucket Policy

While keeping 'Block All Public Access' on, let's allow some accounts to access to a bucket.

## Create a bucket

```sh
aws s3 mb s3://bucket-policy-example-12
```

## Apply Bucket Policy

```sh
aws s3api put-bucket-policy --bucket bucket-policy-example-12 --policy file://policy.json   
```
