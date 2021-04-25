test: #本地测试
	mkdocs serve

update: # 真实构建site
	mkdocs build -d ./.site \
	&& rsync -avzP --progress ./.site/* ../
