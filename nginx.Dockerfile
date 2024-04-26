FROM debian:bookworm-slim
RUN apt update -y
RUN apt install -y nginx libnginx-mod-rtmp gettext-base
COPY etc/nginx/nginx-release.conf ./etc/nginx/nginx.conf.template
COPY scripts/nginx-entrypoint-release.sh .
RUN chmod +x ./nginx-entrypoint-release.sh
ENTRYPOINT ["./nginx-entrypoint-release.sh"]