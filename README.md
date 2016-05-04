# Docker image for cf-cli-autopilot-antifreeze
A docker alpine image which includes the latest cf cli, autopilot and antifreeze plugin

## Usage

	docker pull dominikhahn/cf-cli-autopilot-antifreeze:latest
	docker run -it -v "$(pwd)=/workspace/" dominikhahn/cf-cli-autopilot-antifreeze cf plugins

### Example

	
	#!/bin/bash

	set -e

	cf check-manifest your-app-name -f manifest.yml
	cf zero-downtime-push your-app-name -f manifest.yml


## Info about development

[Cloud Foundry CLI](https://github.com/cloudfoundry/cli)

[Autopilot plugin](https://github.com/concourse/autopilot)

[Antifreeze plugin](https://github.com/odlp/antifreeze)
