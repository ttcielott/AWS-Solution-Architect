# Client Side Encryption

**Client-Side Encryption** is when you encrypt your own file before uploading them to s3. This provides a guarantee that AWS and no third-party can decrypt your data.

## Setup

You need to install Ruby for this practice.

[How To Install Ruby on Rails with rbenv on macOS](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos)


## Create a bucket

```sh
aws s3 mb s3://encryption-client-ab-124
```

## Create a file

```sh
echo "Hello world" > hello.txt
```

## Run our SDK ruby script

```sh
bundle exec ruby encrypt.rb
```