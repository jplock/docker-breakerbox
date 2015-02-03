# DOCKER-VERSION 1.0.0
# VERSION        0.2

FROM java:openjdk-7-jre
MAINTAINER Justin Plock <justin@plock.net>

RUN wget -q -O - https://github.com/yammer/breakerbox/releases/download/breakerbox-parent-0.1.2/breakerbox-0.1.2.tar.gz | tar -xzf - -C /opt

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 8080 8081

WORKDIR /opt

ENTRYPOINT ["java", "-Darchaius.configurationSource.additionalUrls=file:config.properties", "-jar", "breakerbox-service-0.1.2.jar"]
CMD ["server", "breakerbox.yml"]
