# Notes

## Docker 多阶段构建

```shell
docker build --target builder -t alexellis2/href-counter:latest .
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf

```
