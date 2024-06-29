# s3api

## create bucket

Regions outside of us-east-1 require the appropriate LocationConstraint to be specified in order to create the bucket in the desired region.

```api
aws s3api create-bucket --bucket my-bucket-dana --create-bucket-configuration LocationConstraint=eu-west-2
```

## query output

For example

```api
aws s3api list-buckets
```

The output of the sh above is as follows.

```json
{
    "Buckets": [
        {
            "Name": "my-bucket-dana",
            "CreationDate": "2024-06-03T21:22:02+00:00"
        }
    ],
    "Owner": {
        "ID": "wrwetwetwe"
    }
}
```

You can query the name of the bucket by using the following sh.

```api
 aws s3api list-buckets --query 'Buckets[].Name' 
```

```api
aws s3api list-buckets --query "Buckets[?Name == 'my-bucket-dana'].Name"
```

## change output format

```api
aws s3api list-buckets --output yaml
```

## download object from bucket

```api
aws s3api get-object --bucket my-bucket-dana --key images/mulan.jpeg mulan_downloaded.jpeg
```

The last argument, `mulan_downaloded.jpeg` is the filename where the content will be saved.

## Upload object to buckekt

```api
aws s3api put-object --bucket my-bucket-dana --key dog.txt --content-type plain/txt --body dog.txt
```

## Query objects

```api
aws s3api list-objects --bucket my-bucket-dana --query "Contents[].Key"
```

## Remove objects

```api
aws s3 rm s3://my-bucket-dana --recursive
```