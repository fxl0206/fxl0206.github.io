#common
module=$(word 1,${MAKECMDGOALS})
localIndexs=~/.hubx/indexs
moduleHome=~/.hubx/${module}
repoUrl=https://fxl0206.github.io
moduleUrl=${repoUrl}/${module}

ifeq ($(findstring $(module),help clean addAll commit push),$(module))

${localIndexs}:
	@curl -s -o ${localIndexs} ${repoUrl}/indexs

help: ${localIndexs}
	@cat ${localIndexs}
clean:
	@rm -rf ~/.hubx/*

addAll:
	git add *

ifeq ("$(M)", "")	
commit:
	@echo "git message can't null,you can use make commit -e M=ok" 
	@exit 1
else
commit:
	git commit -m ${M}
endif
	
push:
	git push origin master
else #自动加载模块

mkfile=${moduleHome}/Makefile-${module}

${mkfile}:
	@if [ ! -d "${moduleHome}" ]; then\
	 mkdir -p ${moduleHome};\
	 fi
	@curl -s -o ${mkfile} ${moduleUrl}/Makefile-${module}

${module}: ${mkfile}
	@echo "use ${module} module"

setContext:
	@echo $$(pwd)>~/.hubx/${module}/.env
	@cat ~/.hubx/${module}/.env

help:
	@grep '^[^#[:space:]].*: ' ${mkfile} | grep "#" | awk -F'#'  {'print "--> "$$1  "#"$$2'}

include ${mkfile}
endif

