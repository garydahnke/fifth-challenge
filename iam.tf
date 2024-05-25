resource "aws_iam_role" "ec2_access_to_s3_role" {
    name = "EC2_Access_To_S3_Role"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "ec2_access_to_s3_role_policy" {
    name = "EC2_Access_To_S3_Role_Policy"
    role = aws_iam_role.ec2_access_to_s3_role.id

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

# resource "aws_iam_role" "ec2_access_to_s3_role" {
#     name = "EC2_Access_To_S3_Role"

#     assume_role_policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "Service": "ec2.amazonaws.com"
#             },
#             "Action": "sts:AssumeRole"
#         }
#     ]
# }
# EOF
#     # assume_role_policy - (Required) Policy that grants an entity permission to assume the role.
#     # assume_role_policy = jsonencode({
#     #     "Version": "2012-10-17",
#     #     "Statement": [
#     #         {
#     #             "Effect": "Allow",
#     #             "Action": [
#     #                 "s3:*",
#     #                 "s3-object-lambda:*"
#     #             ]
#     #         }
#     #     ]
#     # })
# }