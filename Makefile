build:
	docker build -t dominikhahn/docker-cf-cli-autopilot-antifreeze --rm=true .

debug:
	docker run -it --rm dominikhahn/docker-cf-cli-autopilot-antifreeze /bin/ash

run:
	docker run -it --rm dominikhahn/docker-cf-cli-autopilot-antifreeze ${CMD}
