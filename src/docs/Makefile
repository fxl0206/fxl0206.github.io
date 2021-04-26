#common
module=$(word 1,${MAKECMDGOALS})
localIndexs=~/.hubx/indexs
repoUrl=https://fxl0206.github.io
moduleUrl=${repoUrl}/${module}

ifeq ($(findstring $(module),help clean),$(module))

${localIndexs}:
#	@cp indexs ${localIndexs}
	curl -s -o ${localIndexs} ${repoUrl}/indexs

help: ${localIndexs}
	@cat ${localIndexs}
clean:
	@rm -rf ~/.hubx/*
else #自动加载模块

mkfile=~/.hubx/Makefile-${module}

${mkfile}: 
#	cp ${module}/Makefile-${module} ${mkfile}
	curl -s -o ${mkfile} ${moduleUrl}/Makefile-${module}

${module}: ${mkfile}
	@echo "use ${module} module"
help:
	@grep '^[^#[:space:]].*: ' ${mkfile} | grep "#" | awk -F'#'  {'print "--> "$$1  "#"$$2'}

include ${mkfile}
endif