FROM node:8

RUN apt-get -qq update && \
    apt-get install --no-install-recommends -y -q \
    curl \
    unzip \
    build-essential

RUN curl -sSJL "https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip" -o /tmp/google-cloud-sdk.zip \
    && unzip -q /tmp/google-cloud-sdk.zip -d /usr/local \
    && rm -f /tmp/google-cloud-sdk.zip \
    && /usr/local/google-cloud-sdk/install.sh \
        --usage-reporting=true \
        --path-update=true \
        --bash-completion=true \
        --rc-path=/root/.bashrc

env PATH /usr/local/google-cloud-sdk/bin:$PATH~