# CRAETE local.py file by renaming/copying default.local.py
# User should update the VPC details below in local.py
VPC = {
    "ID": "vpc-78fb0803",
    "CIDR_BLOCKS": ["172.24.8.0/21"],
    "SUBNETS": ["subnet-b28a83f9", "subnet-701e5a2d"]
}


# CUstom tags that can be defined by user
CUSTOM_RESOURCE_TAGS = [
    {'Application': "PacBot"},
    {'Environment': "Dev"},
    {'Name': "PacbotApplication"},
    {'SysName': "Pacbot"},
    {'Scheduler': "S-C-US-NT18A-OD"},
    {'Backup': "false"},
    {'Monitoring': "CWM"},
    {'SSMManged': "False"},
    {'Patch Group': "False"},
    {'TSM': "aparna.manjunath@regeneron.com"},
    {'SysOwner': "rakesh.singh@regeneron.com"},
    {'CostCenter': "0512"}
]


# RDS Related Configurations
RDS_INSTANCE_TYPE = "db.t2.medium"  # Possibble values db.m4.large, db.t2.large etc


# ElasticSearch Related Configurations
ES_INSTANCE_TYPE = "m4.large.elasticsearch"  # Possibble values m4.xlarge.elasticsearch, t2.xlarge.elasticsearch etc
ES_VOLUME_SIZE = 20

# ALB related configurations
MAKE_ALB_INTERNAL = False  # False if ALB need to be public(internet facing) else True
ALB_PROTOCOL = "HTTP"
SSL_CERTIFICATE_ARN = ""  # Required only if ALB_PROTOCOL is defined as HTTPS
PACBOT_DOMAIN = ""  # Required only if you point a CNAME record to ALB ex: app.pacbot.com


# MAIL Server configuration
MAIL_SERVER = "email-smtp.us-east-1.amazonaws.com"
MAIL_SERVER_PORT = 587
MAIL_PROTOCOL = "smtp"
MAIL_SERVER_USER = "AKIAT3YMBRJXQMOJ4KVM"
MAIL_SERVER_PWD = "BFGvjtvYNfxjmW+CoRpyQ9ZXupNvJJbOXi0ESU4k8Mmb"
MAIL_SMTP_AUTH = ""
MAIL_SMTP_SSL_ENABLE = "true"
MAIL_SMTP_SSL_TEST_CONNECTION = "false"

USER_EMAIL_ID = "rakesh.singh@regenron.com,priyanka.Sharma@regeneron.com,aparna.manjunath@regeneron.com"

# System reads below data from user if not updated here
AWS_ACCESS_KEY = ""
AWS_SECRET_KEY = ""
AWS_REGION = ""


# This settings enable Vulnerability feature and servie
ENABLE_VULNERABILITY_FEATURE = False
QUALYS_API_URL = ""  # Qualys API Url without trailing slash
QUALYS_INFO = ""  #Base64 encoded user:password of qualys
