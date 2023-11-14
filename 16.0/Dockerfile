FROM ubuntu:latest

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        python3 \
        python3-pip \
        npm

RUN mkdir odoo-dev
WORKDIR "/odoo-dev"

RUN git clone --single-branch --branch 16.0 --depth=1 https://github.com/odoo/odoo odoo

RUN curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb && \
    apt-get install -y --no-install-recommends ./wkhtmltox.deb && \
    rm -f wkhtmltox.deb

WORKDIR /odoo-dev/odoo

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Denver

RUN sed -n -e '/^Depends:/,/^Pre/ s/ python3-\(.*\),/python3-\1/p' debian/control | xargs apt-get install -y --no-install-recommends

RUN npm install -g rtlcss

COPY ./run-odoo.sh /odoo-dev/
RUN sed -i -e 's/\r$//' /odoo-dev/run-odoo.sh
RUN chmod +x /odoo-dev/run-odoo.sh

EXPOSE 8069 8071 8072

RUN mkdir -p /odoo-dev/hits-apps

WORKDIR /odoo-dev
