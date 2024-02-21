FROM ubuntu

RUN apt-get update -qq \
    && apt-get install -y curl nginx

COPY start.sh /
RUN chmod +x /start.sh
ENV TITLE=welcome
EXPOSE 80
CMD [  "/start.sh" ]