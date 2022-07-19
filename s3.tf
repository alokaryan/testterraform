resource "aws_s3_bucket" "nnbucket" {
	bucket = "networknuts-jenkins-terra-aws"
	acl = "public-read"
	versioning {
		enabled = true
	}

	tags = {
		Name = "networknuts-jenkins-terra-aws"
	}

	lifecycle_rule {
		id = "log"
		enabled = true
		prefix = "log/"
		tags = {
			"rule" = "log"
			"autoclean" = "true"
		}
		transition {
			days = 35
			storage_class = "STANDARD_IA"
		}
		transition {
			days = 65
			storage_class = "GLACIER"
		}
		expiration {
			days = 100
		}
	}
}
