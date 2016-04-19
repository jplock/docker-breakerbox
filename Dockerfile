FROM java:openjdk-8-jre-alpine
MAINTAINER Justin Plock <justin@plock.net>

LABEL name="breakerbox" version="0.4.2"

RUN mkdir /opt \
    && wget -q -O - https://github.com/yammer/breakerbox/releases/download/breakerbox-parent-0.4.2/breakerbox-0.4.2.tar.gz | tar -xzf - -C /opt

EXPOSE 8080 8081

WORKDIR /opt

VOLUME ["/opt"]

ENTRYPOINT ["java", "-jar", "breakerbox-service-0.4.2.jar"]
CMD ["server", "breakerbox.yml"]
