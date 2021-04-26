test: #本地测试
	mkdocs serve

index:
	@find ./docs -name "Makefile-*" | awk -F'-'  {'print $$2'} > ${CURDIR}/docs/indexs
	@echo "tar -zcvf modules.tgz Makefile\\">${CURDIR}/docs/wrapper.sh
	@cat ${CURDIR}/docs/indexs | while read line; do echo " $$line/Makefile-$$line \\">>${CURDIR}/docs/wrapper.sh; done;
	@cd docs && sh ${CURDIR}/docs/wrapper.sh

up: index# 真实构建site
	mkdocs build -d ./.site \
	&& rsync -avzP --chmod=D777,F777 --progress ./.site/* ../

deploy: #部署到github
	git add ../*
	git commit -m "up"
	git push origin master 

