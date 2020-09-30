# tf-aws-pi-hole

## Overview

This repo is responsible for managing/creating an ec2 instance inside of aws free tier t2.micro with an elastic ip address and deploying pihole preconfigured into that instance

It will also create a user/role/policy that can then be used from this point forwards to manage the service. However for first time run. Higher permissions are needed in order for the tf to be able to create the resources required.
