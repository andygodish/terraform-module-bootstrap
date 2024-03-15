FROM hashicorp/terraform:1.7

# Update and install dependencies
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk add --no-cache make && \
    # Add any specific packages you need to install here, e.g., apk add --no-cache git
    rm -rf /var/cache/apk/*

# Installs Python/pip --- requried to install az cli on Alpine
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Install AZ CLI --- https://github.com/Azure/azure-cli/issues/19591
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
RUN pip install azure-cli

WORKDIR /app

