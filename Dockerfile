FROM alpine:3.20

RUN apk --update --no-cache add openjdk8 curl && \
  curl -s -o /tmp/apache-ant-1.9.8-bin.tar.gz 'https://archive.apache.org/dist/ant/binaries/apache-ant-1.9.8-bin.tar.gz' && \
  tar -zxf /tmp/apache-ant-1.9.8-bin.tar.gz -C /opt && \
  rm -f /tmp/apache-ant-1.9.8-bin.tar.gz

ENV ANT_HOME="/opt/apache-ant-1.9.8"
ENV ANT_OPTS="-Xms256M -Xmx512M"
ENV PATH="${PATH}:${ANT_HOME}/bin"

WORKDIR /project

ENTRYPOINT [ "ant" ]
