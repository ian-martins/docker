FROM debian:12

WORKDIR /opt

RUN apt update && apt upgrade -y && \
    apt install openjdk-17-jdk-headless unzip -y

COPY glassfish.zip /opt/
RUN unzip /opt/glassfish.zip && \
    rm ./glassfish.zip


EXPOSE 8181 8080 4848

ENTRYPOINT ["/entrypoint.sh"]