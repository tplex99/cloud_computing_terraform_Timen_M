# Create a bucket
provider "aws"{ //uitvoeren voor/op aws
    region ="eu-west-1" //regin select
}

resource "aws_s3_bucket" "r0802093-123321" {
  bucket = "r0802093" //naam van bucket moet uniek zijn in heel de wereld
  acl    = "public-read"   # or can be "private"
  tags = {
    Name        = "r0802093-123321"
  }
    versioning {
    enabled = true
  }
}

# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.r0802093-123321.id
  key    = "image.png"
  acl    = "public-read"  # or can be " private"
  source = "../dieltiens_files/image.png"
}

