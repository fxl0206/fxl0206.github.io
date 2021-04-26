#common
module=$(word 1,${MAKECMDGOALS})

ifeq ($(findstring $(module),clean help),$(module))

clean:
	rm -rf ${CURDIR}/.site

help: 
	@ls build

else #自动加载模块

mkfile=./build/Makefile-$(shell echo $(module)|awk -F'-' '{print $$1}').mk
${module}: 
	@echo "use ${module} module"

help:
	@grep '^[^#[:space:]].*: ' ${mkfile} | grep "#" | awk -F'#'  {'print "--> "$$1  "#"$$2'}

include ${mkfile}
endif