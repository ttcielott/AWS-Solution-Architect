# Change storage class

## Create a bucket

```sh
aws s3 mb s3://class-fun-ab-123
```

## Create a file

```sh
echo "libra" > zodiac.txt
aws s3 cp zodiac.txt s3://class-fun-ab-123
```

## Change the storage class

```sh
aws s3 cp zodiac.txt s3://class-fun-ab-123 --storage-class STANDARD_IA
```

## Remove the bucket and file

```sh
aws s3 rb s3://class-fun-ab-123 --force
```