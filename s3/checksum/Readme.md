## Create a new buckket

```md
aws s3 mb s3://check-sum-20230617
```

## Create a file that will we do a checksum on

```
echo "Hello Sunshine." > myfile.txt
```

## Get a checksum of a file for md5

If md5sum is not pre-installed, install it by running the following command.

```
 brew install md5sha1sum
```

```
 md5sum myfile.txt
# bd4a22cc323ad43c9aa5883b27464fa9  myfile.txt
```

## Upload the file to s3 and look at its etag

```
aws s3 cp myfile.txt s3://check-sum-20230617
```

```
aws s3api head-object --bucket check-sum-20230617 --key myfile.txt
# {
    "AcceptRanges": "bytes",
    "LastModified": "2024-06-17T20:55:57+00:00",
    "ContentLength": 16,
    "ETag": "\"bd4a22cc323ad43c9aa5883b27464fa9\"",
    "ContentType": "text/plain",
    "ServerSideEncryption": "AES256",
    "Metadata": {}
}
```
