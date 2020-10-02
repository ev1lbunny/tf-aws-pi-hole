# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2).

Dates in this file are in format of YYYY-MM-DD (2019-12-13 means 13th of December 2019).

## [[UNRELEASED]](https://github.com/kmalkin/tf-aws-pi-hole/releases/tag/n.n.n) - nnnn-nn-nn

### Added

* NEW `backend-state` code that setups bucket and dynamodb table for remote state management is the user doesnt already have a remote state bucket they can point at.[@kmalkin](https://github.com/kmalkin)
* NEW `open-vpn` module that creates self installing openvpn setup[@kmalkin](https://github.com/kmalkin)
* Remote state configuration for all backend.[@kmalkin](https://github.com/kmalkin)

### Changed

* Updated README's for all modules[@kmalkin](https://github.com/kmalkin)
* Updated .gitignore[@kmalkin](https://github.com/kmalkin)
* Pihole ec2 is now a module[@kmalkin](https://github.com/kmalkin)
* Pihole ec2 now has 10gb volume instead of 20gb[@kmalkin](https://github.com/kmalkin)
* Pihole instance security groups modified to allow cross instance comms from openVpn instance[@kmalkin](https://github.com/kmalkin)

### Fixed

* Sorted out the link between remote state and the locking dynamodb table[@kmalkin](https://github.com/kmalkin)

### Removed

* Iam role policy / user creation. Anyone should just be able to setup the permissions needed to run this into their aws acccount. If not then its not really the purpose of this code to create that.[@kmalkin](https://github.com/kmalkin)

## [[1.2.0]](https://github.com/kmalkin/tf-aws-pi-hole/releases/tag/1.2.0) - 2020-10-01

### Added

* Correcting markdown after linting [@alastairhm](https://github.com/alastairhm)
* upgrade to tf 0.13 [@alastairhm](https://github.com/alastairhm)
* added r53 config [@alastairhm](https://github.com/alastairhm)
* added .tools setup for asdf [@alastairhm](https://github.com/alastairhm)
* added optional flag for the r53 zone in case customers dont have one or want to remain free tier[@kmalkin](https://github.com/kmalkin)

## [[1.1.0]](https://github.com/kmalkin/tf-aws-pi-hole/releases/tag/1.1.0) - 2020-09-30

### Added

* Basic TF code for deployment to aws. [@kmalkin](https://github.com/kmalkin)
* TF code for sgs, ec2, iam all done. along with user data template. [@kmalkin](https://github.com/kmalkin)
