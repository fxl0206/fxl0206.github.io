#common
module=$(word 1,${MAKECMDGOALS})

ifeq ($(findstring $(module),clean syn),$(module))

clean:
	rm -rf ${CURDIR}/.site

syn: 
	rsync -avzP -e 'ssh -p $(imageDelegatePort)' $(CURDIR)/* \
	--include "Makefile" \
	--include "build" \
	--exclude "/*" \
	$(imageDelegateUrl):$(imageDelegateDir)

else #自动加载模块

mkfile=./build/Makefile-$(shell echo $(module)|awk -F'-' '{print $$1}').mk
${module}: 
	@echo "use ${module} module"

help:
	@grep '^[^#[:space:]].*: ' ${mkfile} | grep "#" | awk -F'#'  {'print "--> "$$1  "#"$$2'}

include ${mkfile}
endif