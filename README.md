# VPC
Create AWS VPC and subnets using Terraform in Ireland region (eu-west-1) by default

1 VPC
12 SUBNETS
4 ROUTE TABLES
4 NETWORK ACLS
2 EC2 INSTANCES
2 SGs

This creates a custom VPC with 4 layers i.e. DMZ, WEB, APP, DB
each layer as 3 subnets and the subnets placed in AZ1, AZ2, AZ3

DMZ layer's 3 subnets are connected to DMZ RT
WEB layer's 3 subnets are connected to WEB RT
APP layer's 3 subnets are connected to APP RT
DB layer's 3 subnets are connected to NAT Gateway= DB layer's 3 subnets can be connected to DB RT

DMZ layer's 3 subnets are connected to DMZ NACL
WEB layer's 3 subnets are connected to WEB NACL
APP layer's 3 subnets are connected to APP NACL
DB layer's 3 subnets are connected to DB NACL

APP SERVER EC2 INSTANCE IS HOSTED ON DMZ-AZ1-SUBNET
DB SERVER EC2 INSTANCE IS HOSTED ON DB-AZ1-SUBNET
