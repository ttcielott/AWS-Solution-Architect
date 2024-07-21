# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/EncryptionV2.html
require 'openssl'
require 'aws-sdk-s3'

key = OpenSSL::PKey::RSA.new(1024)

bucket = 'encryption-client-ab-124'
bucket_key = 'hello.txt'

key = OpenSSL::PKey::RSA.new(1024)

# encryption client
s3 = Aws::S3::EncryptionV2::Client.new(
  encryption_key: key,
  key_wrap_schema: :rsa_oaep_sha1, # the key_wrap_schema must be rsa_oaep_sha1 for asymmetric keys
  content_encryption_schema: :aes_gcm_no_padding,
  security_profile: :v2 # use :v2_and_legacy to allow reading/decrypting objects encrypted by the V1 encryption client
)

# round-trip an object, encrypted/decrypted locally
resp = s3.put_object(bucket: bucket, key: bucket_key, body:'handshake')
puts "PUT"
resp = s3.get_object(bucket: bucket, key: bucket_key).body.read
puts "Get with key"
puts resp
#=> 'handshake'

# reading encrypted object without the encryption client
# results in the getting the cipher text
Aws::S3::Client.new.get_object(bucket: bucket, key: bucket_key).body.read
puts "get without key"
puts resp
#=> "... cipher text ..."