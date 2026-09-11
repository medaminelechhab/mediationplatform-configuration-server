FROM proxy-docker.nexus-ein.com.intraMyProject/openjdk:21-slim

LABEL Name="Mediationplatform configuration server"
LABEL Description="Centralized configuration Service for the mediation platform"
LABEL URL="https://gitlab.tech.MyProject/cl-platform"

ARG USER_NAME=mediationplatform
ARG GROUP_NAME=0kogroup
ARG GROUP_ID=2001
ARG USER_ID=1001
ARG HOME_DIR=/home/mediationplatform-configuration-server

RUN apt-get update && \
    apt-get install -y curl && \
    groupadd -g ${GROUP_ID} ${GROUP_NAME} && \
    useradd -u ${USER_ID} -g ${GROUP_NAME} -d ${HOME_DIR} -m -s /bin/sh ${USER_NAME} && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

HEALTHCHECK --interval=5s --timeout=10s --retries=3 CMD curl -sS http://127.0.0.1:9000 || exit 1

WORKDIR $HOME_DIR

COPY target/mediationplatform-configuration-server.jar mediationplatform-configuration-server.jar

USER $USER_NAME

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dspring.profiles.active=kubernetes", "-jar", "/home/mediationplatform-configuration-server/mediationplatform-configuration-server.jar"]

EXPOSE 9000
