#common
help: 
	@grep '^[^#[:space:]].*: ' ${CURDIR}/Makefile | grep "#" | awk -F'#'  {'print "--> "$$1  "#"$$2'}
nslink: #映射当前主机docker netns
	curl -L https://fxl0206.github.io/bin/link-docker-ns.sh | sudo sh