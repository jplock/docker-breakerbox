FROM gliderlabs/alpine:3.3
MAINTAINER Justin Plock <justin@plock.net>

LABEL name="breakerbox" version="0.3.3"

RUN apk-install openjdk7-jre wget bash
RUN mkdir /opt \
    && wget -q --no-check-certificate -O - https://github.com/yammer/breakerbox/releases/download/breakerbox-parent-0.3.3/breakerbox-0.3.3.tar.gz | tar -xzf - -C /opt

ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk

EXPOSE 8080 8081

WORKDIR /opt

ENTRYPOINT ["java", "-Darchaius.configurationSource.additionalUrls=file:config.properties", "-jar", "breakerbox-service-0.3.3.jar"]
CMD ["server", "breakerbox.yml"]
