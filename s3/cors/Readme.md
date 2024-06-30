# Cross Origin Resource Sharing

## Create a Website 1

### Create a bucket

```sh
aws s3 mb s3://cors-example-12
```

### Change block public access

```sh
aws s3api put-public-access-block \
    --bucket cors-example-12 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

### Create a bucket policy (for static website hosting)

[You can get the bucket policy for Setting permissions for website access here.](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteAccessPermissionsReqd.html#bucket-policy-static-site)

```sh
aws s3api put-bucket-policy --bucket cors-example-12 --policy file://bucket-policy.json
```

### Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-example-12 --website-configuration file://website.json
```

### Upload our index.html file and include a resource that would be cross-origin

```sh
aws s3 cp index.html s3://cors-example-12
```

http://cors-example-12.s3-website.eu-west-2.amazonaws.com/


Other region might use '-' between 's3-bucket' and 'region' in URL.

### Get the website endpoint for S3

http://cors-example-12.s3-website.eu-west-2.amazonaws.com

## Create API Gateway with mock response and then ttest the endpoint

```sh
curl -X POST -H "Content-Type: application/json" https://sf1mhod6xa.execute-api.eu-west-2.amazonaws.com/prod/hello
```

Go to http://cors-example-12.s3-website.eu-west-2.amazonaws.com and if you check 'Inspect' by clicking right button of mouse, 
you will see the following error:

```
cors-example-12.s3-website.eu-west-2.amazonaws.com/:1 Access to XMLHttpRequest at 'https://sf1mhod6xa.execute-api.eu-west-2.amazonaws.com/prod' from origin 'http://cors-example-12.s3-website.eu-west-2.amazonaws.com' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource.
```

## Set CORS on a bucket

[Reference page](https://docs.aws.amazon.com/cli/latest/reference/s3api/put-bucket-cors.html)

```sh
aws s3api put-bucket-cors --bucket cors-example-12 --cors-configuration file://cors.json
```

## Enable CORS on API

## Check if CORS worked

1. Go to http://cors-example-12.s3-website.eu-west-2.amazonaws.com
2. Click right button of mouse and go to inspect
3. Go to Network and check Preview.