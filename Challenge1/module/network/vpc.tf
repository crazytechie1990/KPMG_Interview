# create a VPC for KRISHI project

resource "aws_vpc" "krishi-project-vpc" {
    cidr_block = var.krishi_vpc_cidr
    instance_tenancy = "default"
    tags = {
      "Name" = var.tag_name
    }
}

resource "aws_iam_role" "krishi-project-iam-role" {
  name = "KRISHI-IAM-ROLE"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "krishi-project-iam-policy" {
  name = "KRISHI-IAM-POLICY"
  role = aws_iam_role.krishi-project-iam-role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_cloudwatch_log_group" "krishi-project-log-group" {
  name = "KRISHI-LOG-GRP"
}

resource "aws_flow_log" "krishi-project-vpc-flowlog" {
  iam_role_arn    = aws_iam_role.krishi-project-iam-role.arn
  log_destination = aws_cloudwatch_log_group.krishi-project-log-group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.krishi-project-vpc.id
  tags = {
    "Name" = "KRISHI-PROJECT-LOGS"
  }
  depends_on = [
    aws_vpc.krishi-project-vpc, aws_cloudwatch_log_group.krishi-project-log-group, aws_iam_role.krishi-project-iam-role
  ]
}

resource "aws_internet_gateway" "krishi-project-igw" {
  vpc_id = aws_vpc.krishi-project-vpc.id
  tags = {
    "Name" = "KRISHI-PROJECT-IGW"
  }
}


