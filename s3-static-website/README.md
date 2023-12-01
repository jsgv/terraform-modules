# S3 static website

Creates public (static website) hosted on an S3 bucket. A cloudfront distribution and an SSL
certicate are also created and used to serve the bucket.

`zone_id` is required since DNS records are used to validate the ACM certificate.

### Assumptions:

* Route53 is used to manage target domain DNS records (zone_id is required).

### Usage:

```hcl
module "s3_bucket_blog" {
  source         = "git@github.com:jsgv/terraform-modules.git//s3-static-website"
  bucket         = "blog.example.com"
  domain         = "blog.example.com"
  zone_id        = aws_route53_zone.main.zone_id

  tags = {
    App = var.app_name
  }
}
```

### Resources created:

* S3 Bucket
* Route53 DNS records
* ACM TLS certificate
* CloudFront distribution

### Notes:

I was unable to completely block public access and only allowing CloudFront access to the bucket while also keeping the static website functionality (automatic indexing of files in directory paths). Pull requests that fix this are greatly appreciated.
