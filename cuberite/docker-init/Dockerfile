FROM ubuntu:focal
LABEL maintainer="ngehrsitz"
RUN apt-get update && apt-get install -y \
    gettext-base \
    && apt-get clean
WORKDIR /templates
COPY update-serverconfig.sh .
COPY empty.sqlite .
COPY *.default.ini ./
RUN chmod 744 update-serverconfig.sh
ENTRYPOINT ["./update-serverconfig.sh"]