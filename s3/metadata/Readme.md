# S3 Bucket Metadata

## Create a bucket

```sh
aws s3 mb s3://metadata-fun-ab-123
```

### Creata a new file

```sh
echo "Hello Saturn!" > saturn.txt
```

## Upload a file with metadata

```sh
aws s3api put-object --bucket metadata-fun-ab-123 --key saturn.txt --body saturn.txt --metadata Planet=Saturn
```

## Get metadata through head object

```sh
aws s3api head-object --bucket metadata-fun-ab-123 --key saturn.txt
```

output:

```json
{
    "AcceptRanges": "bytes",
    "LastModified": "2024-06-22T15:02:46+00:00",
    "ContentLength": 13,
    "ETag": "\"0d24762b215ed0950c9a4a0ace425c67\"",
    "ContentType": "binary/octet-stream",
    "ServerSideEncryption": "AES256",
    "Metadata": {
        "planet": "Saturn"
    
```