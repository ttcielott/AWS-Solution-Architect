# STS assume role

## Create a user with no permissions

We need to create a new user with no permissions and generate out access keys

```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
```

Add a new profile with a new credential

```sh
open ~/.aws/credentials
```

Test who you are.

```sh
aws sts get-caller-identity --profile sts
```

Make sure you don't have access to s3. (expected output: `An error occurred (AccessDenied) when calling the ListBuckets operation`)

```sh
aws s3 ls --profile sts
```

## Create a role

We need to create a role that will access a new resource

```sh
chmod u+x bin/deploy
./bin/deploy
```

## Use new user credentials and assume role

```sh
STS_ROLE_ARN=$(aws iam list-roles | jq -r '.Roles[] | select(.RoleName | contains("sts")) | .Arn')

```sh
aws sts assume-role \
    --role-arn $STS_ROLE_ARN \
    --role-session-name s3-sts-fun3 \
    --profile sts
```

Save the credential

```sh
open ~/.aws/credentials
```

## Clean-up

Delete access key

```sh
aws iam delete-access-key \
    --access-key-id STS-MACHINE-USER-ACCESS-KEY \
    --user-name sts-machine-user
```

Delete User

```sh
aws iam delete-user \
    --user-name sts-machine-user
```
