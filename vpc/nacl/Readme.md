# NACL

## Create a new VPC on console

## Get VPC ID

```sh
VPC_ID=$(aws ec2 describe-vpcs \
--filters "Name=tag:Name,Values=nacl-example-vpc" \
--query "Vpcs[*].VpcId" --output text)
```

## Grab Image ID

```sh
aws ec2 describe-images --region eu-west-2 --owners amazon --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" --query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" --output text
```

Add the output to parameters in `template.yml`.

## Grab a subnet ID 

On console, find the subnet id associated with the created VPC and add it to parameters in `template.yml`.

## Check if Webserver is running on EC2

1. Connect to EC2 instance via Session Manager
2. Run `sudo su - ec2-user`
3. Run `wget localhost:80`
4. Run `sudo systemctl status httpd`
5. Go to Instance Detail and open public IPv4 address

## Block your IP address via NACL

1. Go to VPC on console
2. Go to Network ACLs
3. Select NACL associated with the subnet
4. Edit Inbound Rules and add new rule
5. Add `90` as Rule Number which is higher priority than existing 100, `All traffic` as Type, `your IP address/32` as source,and `Deny` as Allow/Deny
