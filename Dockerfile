FROM java:openjdk-7-jre
MAINTAINER Justin Plock <justin@plock.net>

RUN wget -q -O - https://github.com/yammer/breakerbox/releases/download/breakerbox-parent-0.2.6/breakerbox-0.2.6.tar.gz | tar -xzf - -C /opt

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 8080 8081

WORKDIR /opt

ENTRYPOINT ["java", "-Darchaius.configurationSource.additionalUrls=file:config.properties", "-jar", "breakerbox-service-0.2.6.jar"]
CMD ["server", "breakerbox.yml"]
