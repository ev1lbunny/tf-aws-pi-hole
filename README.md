 # tfawspihole
 ## Complete Terraform solution to Pi Hole install

 * Many thanks to the guys and gals that actually provide this free opensource tool for the benefit of us all.
 https://pihole.net/
 * Also Many thanks to leomoonstudios for making a silent installed for openvpn:  https://github.com/leomoonstudios/openvpninstallerforlinux

 ## Overview

 This repo is responsible for managing/creating an ec2 instance inside of aws with an elastic ip address and deploying pihole preconfigured into that instance

 Also configured if you use version 2.#.# onwards is the ability to have a preconfigured openvpn instance too so not jsut the dns is filtered but all traffic can then go down the vpn too

 ## Prerequisites
 * A basic knowledge of terraform , how to apply and run it.
 * A basic understanding of how to configure / setup and use aws cli commands.  You will need to setup appropriate profile

 NB
 * It is recommended that you setup/and use a remote state.

 ## Versions

 See change log for specifics.

  1.#.# >= only the Pi Hole deployment (Now this works we are probably not expecting much more to be added here except standard updates/patches)
  2.#.# >= both the Pi Hole and OpenVPN

 ## Usage

 ### Setup
 * Checkout the code. Enter the `backendstate` directory and run `terraform init && terraform apply`. This will create the backend remote state objects. Take note of the bucket name output.
 * Then simply run `terraform apply` in the parent terraform directory and provide the variables required. It will create the rest.
 * Or include the variables in a parameter file like `terraform apply varfile=params/default.tfvars`

 ### Different types of infra configurations
 * The 3 variables control what type of infra deployment you want. By default you will get single instance pihole and open vpn deployment inside the single ec2 instance.
 ```
 variable "enable_separate_openvpn_instance"  false
 variable "enable_separate_pihole_instance"  false
 variable "split_instances"  false
 ```
 * Setting `split_instances` to true, means you then need to choose which separate instances you want. You can have just 1 or both and use them individually or together.


 ### Post infra deployment
 * The only step to do is to pull the *.ovpn config for programs like (tunnelblick) from the preconfigured openvpn isntance using SCP.
 * EG. `scp i "YOURCERT.pem" ubuntu@YOUREC2INSTANCE:/etc/openvpn/client/default_client.ovpn .`
 * Of course you can login via ssh and create new client setups if you require. OpenVPN is configurable once logged in with `sudo lmovpn`


 ## Future features

 * ASG to ensure there is always a running instance
 * Variablised instance type so that it can be run on other instance types instead of just t2.mico (free tier)
 * Variablised hostname to pass into the pihole ec2 setup
 * Completed permissions map for the bespoke created IAM user/role/policy

 # !!!! DISCLAIMER !!!!

 All code is currently designed to run within aws. All costs are down to the responsibility of the aws account owner. If you dont know/understand what this is deploying. Dont deploy it. There may be running costs involved with elastic ips/storage/keypairs that you as the aws account owner would be responsible for.
