# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2).

Dates in this file are in format of YYYY-MM-DD (2019-12-13 means 13th of December 2019).

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
