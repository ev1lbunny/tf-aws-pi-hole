# tf-aws-pi-hole
## Complete Terraform solution to Pi Hole install

Many thanks to the guys and gals that actually provide this free opensource tool for the benefit of us all.
https://pi-hole.net/


## Overview

This repo is responsible for managing/creating an ec2 instance inside of aws free tier t2.micro with an elastic ip address and deploying pihole preconfigured into that instance

It will also create a user/role/policy that can then be used from this point forwards to manage the service. However for first time run. Higher permissions are needed in order for the tf to be able to create the resources required.

For now the user it creates is a placeholder and had an incomplete policy. So will need admin to release initial run.

## Prerequisites

* A basic knowledge of terraform , how to apply and run it.
* A basic understanding of how to configure / setup and use aws cli commands. -- You will need to setup appropriate profile

##NB
* It is recommended that you setup/and use a remote state config by updating the `terraform {}` block in the `versions.tf` to use some form of remote state management etc. However I am not planning on making remote state mandatory. If people want to run and keep state in local systems, thats fine, although not recommended. To that end, there is a `backend-state` module that you can run if you choose too which will create the bucket and dynamo db table needed for backend state. Then you can just update the `terraform {}` definition to use the new backend resources if you choose.

## Versions

See change log for specifics.

1.#.# >= only the Pi Hole deployment (Now this works we are probably not expecting much more to be added here except standard updates/patches)
2.#.# >= both the Pi Hole and OpenVPN

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
