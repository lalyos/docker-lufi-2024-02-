FROM ubuntu:22.04
#FROM ubuntu@sha256:f9d633ff6640178c2d0525017174a688e2c1aef28f0a0130b26bd5554491f0da

RUN apt-get update -qq \
    && apt-get install -y curl nginx \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /
RUN chmod +x /start.sh
ENV TITLE=welcome
EXPOSE 80
CMD [  "/start.sh" ]