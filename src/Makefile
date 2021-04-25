#common
module=$(word 1,${MAKECMDGOALS})

ifeq ($(findstring $(module),clean syn),$(module))

clean:
	rm -rf ${CURDIR}/.site

help: 
	@echo ok

else #自动加载模块

mkfile=./build/Makefile-$(shell echo $(module)|awk -F'-' '{print $$1}').mk
${module}: 
	@echo "use ${module} module"

help:
	@grep '^[^#[:space:]].*: ' ${mkfile} | grep "#" | awk -F'#'  {'print "--> "$$1  "#"$$2'}

include ${mkfile}
endif