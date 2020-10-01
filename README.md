# tf-aws-pi-hole

## Overview

This repo is responsible for managing/creating an ec2 instance inside of aws free tier t2.micro with an elastic ip address and deploying pihole preconfigured into that instance

It will also create a user/role/policy that can then be used from this point forwards to manage the service. However for first time run. Higher permissions are needed in order for the tf to be able to create the resources required.

For now the user it creates is a placeholder and had an incomplete policy. So will need admin to release initial run.

## Prerequisites

A basic knowledge of terraform , how to apply and run it.
A basic understanding of how to configure / setup and use aws cli commands. -- You will need to setup appropriate profile

## Versions

See change log for specifics. Recommended that the latest tag is always used rather than master

## Usage

Simply run `terraform-apply` and provide the variables required. It will create the rest.

Or include the variables in a parameter file like `terraform apply -var-file=params/default.tfvars`

## Future features

* SG to ensure there is always a running instance
* ariablised instance type so that it can be run on other instance types instead of just t2.mico (free tier)
* Variablised hostname to pass into the pihole ec2 setup
* Completed permissions map for the bespoke created IAM user/role/policy

# !!!! DISCLAIMER !!!!

All code is currently designed to run within aws free tier. However there are still certain costs associated with running infra in aws. All costs are down to the responsibility of the aws account owner. If you dont know/understand what this is deploying. Dont deploy it. There may be running costs involved with elastic ips/storage/keypairs that you as the aws account owner would be responsible for.
