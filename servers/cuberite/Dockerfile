FROM ubuntu:eoan AS download
ADD https://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/lastSuccessfulBuild/artifact/Cuberite.tar.gz .
RUN tar -xf Cuberite.tar.gz

FROM ubuntu:eoan
LABEL maintainer="ngehrsitz"
RUN apt-get update && apt-get install -y \
    gettext-base \
    && apt-get clean
WORKDIR /cuberite
RUN adduser --disabled-password --gecos '' cuberite-user
RUN chown cuberite-user:cuberite-user /cuberite
USER cuberite-user
COPY --chown=cuberite-user:cuberite-user *.default.ini ./
COPY --chown=cuberite-user:cuberite-user start-server.sh .
COPY --chown=cuberite-user:cuberite-user --from=download Server .
EXPOSE 25565/tcp
EXPOSE 8080/tcp
ENTRYPOINT ["./start-server.sh"]