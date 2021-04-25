test: #本地测试
	mkdocs serve

index:
	@find ./docs -name "Makefile-*" | awk -F'-'  {'print $$2'} > ${CURDIR}/docs/indexs
	@cat ${CURDIR}/docs/indexs

up: index# 真实构建site
	mkdocs build -d ./.site \
	&& rsync -avzP --chmod=D777,F777 --progress ./.site/* ../
