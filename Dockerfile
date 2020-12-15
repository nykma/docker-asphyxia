FROM ubuntu:20.04
LABEL maintainer="Nyk Ma <i@nyk.ma>"

ARG CORE_VERSION
ARG PLUGIN_VERSION
ENV CORE_VERSION=1.20 PLUGIN_VERSION=0.3

WORKDIR /app

ADD config.sample.ini /app/config.ini
ADD start.sh /app/start.sh

RUN apt-get update && apt-get install -y wget unzip && \
        wget "https://github.com/asphyxia-core/asphyxia-core.github.io/releases/download/v${CORE_VERSION}/asphyxia-core-linux-x64.zip" && \
        unzip asphyxia-core-linux-x64.zip && \
        mv asphyxia-core-linux-x64 asphyxia && \
        chmod +x ./asphyxia && \
        rm *.zip && \
        cd /app/plugins && \
        wget "https://github.com/asphyxia-core/plugins/archive/${PLUGIN_VERSION}.zip" && \
        unzip ${PLUGIN_VERSION}.zip && \
        mv plugins-${PLUGIN_VERSION}/* ./ && \
        rm -r *.zip plugins-${PLUGIN_VERSION} && \
        mv /app/plugins /app/plugins_sample && \
        apt-get remove -y wget unzip && \
        apt-get clean autoclean && \
        apt-get autoremove --yes && \
        rm -rf /var/lib/apt/lists/* && \
        mkdir /app/save /app/config /app/plugins && chmod a+x /app/start.sh

EXPOSE 8083 5700

VOLUME ["/app/save", "/app/config", "/app/plugins"]

CMD ["/app/start.sh"]
