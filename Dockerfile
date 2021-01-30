FROM alpine:3.12

# https://aur.archlinux.org/packages/kubectl-bin/
ENV KUBECTL_VERSION "1.19.2"

# https://github.com/hypnoglow/helm-s3
ENV HELM_S3_PLUGIN_VERSION "0.9.2"

# set some defaults
ENV AWS_DEFAULT_REGION "us-east-1"

RUN apk update && apk --no-cache upgrade
RUN apk add --update bash ca-certificates git python3 jq curl docker docker-compose
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /usr/local/bin

COPY install.sh /opt/install.sh
RUN /opt/install.sh

CMD bash
