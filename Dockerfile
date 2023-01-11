FROM ubuntu:22.04

ARG CDT_PACKAGE_URL=https://github.com/AntelopeIO/cdt/releases/download/v3.0.1/cdt_3.0.1_amd64.deb

RUN apt update \
    && apt install --yes build-essential cmake curl unzip \
    && curl --location --output ./cdt.deb --silent $CDT_PACKAGE_URL \
    && apt install --yes ./cdt.deb \
    && rm --recursive /var/lib/apt/lists/* ./cdt.deb

COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
