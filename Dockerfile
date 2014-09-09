# DOCKER-VERSION 1.0.0
# VERSION        0.1

FROM debian:jessie
MAINTAINER Justin Plock <justin@plock.net>

RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget
RUN wget -q -O /opt/breakerbox-0.1.1.tar.gz https://github.com/yammer/breakerbox/releases/download/breakerbox-parent-0.1.1/breakerbox-0.1.1.tar.gz | tar -xzf - -C /opt

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 8080 8081

WORKDIR /opt

ENTRYPOINT ["java", "-Darchaius.configurationSource.additionalUrls=file:config.properties", "-jar", "breakerbox-service-0.1.1.jar"]
CMD ["server", "breakerbox.yml"]
