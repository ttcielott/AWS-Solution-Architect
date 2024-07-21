# S3 Bucket Key

When you use SSE-KMS, an individual data key used on every object request.
In this case, S3 has to call AWS KMS everytime a request is made.
KMS charges on the number of requests and so this charge can add up.

**S3 Bucket key** lets you generate a short-lived bucket-level key from AWS key that is temporarily stored in S3.

- This will reduce request costs by up to 99%.
- This will decrease request traffic improve overall performance.
- A unique bucket-level key is generated for each requester.
- You can enable Bucket Key at the bucket level to apply to all new objects.
- S3 Bucket key can be enabled for SSE-S3 and SSE-KMS.

    - As SSE-S3 is free, so only benefit of using Bucket key would be that it can improve performance.
