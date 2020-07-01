FROM ubuntu:focal AS download
ADD https://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/lastSuccessfulBuild/artifact/Cuberite.tar.gz .
RUN mkdir -p Server
RUN tar -C Server/ -xf Cuberite.tar.gz

FROM ubuntu:focal
LABEL maintainer="ngehrsitz"
WORKDIR /cuberite
RUN adduser --disabled-password --gecos '' cuberite-user
RUN chown cuberite-user:cuberite-user /cuberite
COPY --chown=cuberite-user:cuberite-user --from=download Server .
RUN chmod 744 Cuberite
USER cuberite-user
EXPOSE 25565/tcp
EXPOSE 8080/tcp
ENTRYPOINT ["./Cuberite"]
CMD ["--no-output-buffering"]