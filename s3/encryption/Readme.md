# Encryption

## Create a bucket

```sh
aws s3 mb s3://encryption-fun-ab-124
```

## Create a file and Put Object with encryption SSE-S3 (default)

```sh
echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://encryption-fun-ab-124
```

If you check in the console, the current server-side encryption is SSE-S.

## Put Object with Encryption of SSE-KMS

We will change the server-side encryption to SSE-KMS.

```sh
aws s3api put-object --bucket encryption-fun-ab-124 \
--key hello.txt --body hello.txt \
--server-side-encryption "aws:kms" \
--ssekms-key-id "{go to kms > AWS managed kkeys and copy & paste 'Key Id' of the alias, aws/s3}"
```

## Put Object with Encryption of SSE-C

Create a Customer Key

```sh
openssl rand -out ssec.key 32 
# `rand`: Note that the number of bytes appears after any options
```

```sh
aws s3 cp hello.txt s3://encryption-fun-ab-124/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key
```

Now, remove hello.txt in your local and try to download it from s3

```sh
rm hello.txt && \
aws s3 cp s3://encryption-fun-ab-124/hello.txt hello.txt
```

Output will say:

```sh
fatal error: An error occurred (400) when calling the HeadObject operation: Bad Request
```

Try again with the following:

```sh
aws s3 cp s3://encryption-fun-ab-124/hello.txt hello.txt \
--sse-c AES256 --sse-c-key fileb://ssec.key
```

Now it must be downloaded.
