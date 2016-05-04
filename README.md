# Docker image for cf-cli-autopilot-antifreeze
A docker alpine image which includes the latest cf cli, autopilot and antifreeze plugin

## Usage

	docker pull dominikhahn/cf-cli-autopilot-antifreeze:latest
	
	docker run -it -v "$(pwd)=/workspace/" dominikhahn/cf-cli-autopilot-antifreeze cf zero-downtime-push --help
	
	docker run -it -v "$(pwd)=/workspace/" dominikhahn/cf-cli-autopilot-antifreeze cf check-manifest --help
	
### Example
	
	#!/bin/bash

	set -e
	
	#Containername
	NAME="Example"
	
	# Start the container in deatached mode
	docker run -it -d --hostname="$NAME" --name="$NAME" -v "$(pwd)=/workspace/" dominikhahn/docker-cf-cli-autopilot-antifreeze:latest
	
	# Execute commands inside the container
	docker exec $NAME cf check-manifest your-app-name -f manifest.yml
	docker exec $NAME cf zero-downtime-push your-app-name -f manifest.yml

## Info about development

[Cloud Foundry CLI](https://github.com/cloudfoundry/cli)

[Autopilot plugin](https://github.com/concourse/autopilot)

[Antifreeze plugin](https://github.com/odlp/antifreeze)
