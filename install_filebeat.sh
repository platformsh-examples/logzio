#!/usr/bin/env bash

# Install Filebeat.
FILEBEAT_VERSION=7.4.0
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$FILEBEAT_VERSION-linux-x86_64.tar.gz
mkdir filebeat && tar xzvf filebeat-$FILEBEAT_VERSION-linux-x86_64.tar.gz -C filebeat --strip-components 1
rm filebeat-$FILEBEAT_VERSION-linux-x86_64.tar.gz

# Download the certificate.
wget https://raw.githubusercontent.com/logzio/public-certificates/master/COMODORSADomainValidationSecureServerCA.crt
mkdir -p filebeat/pki/tls/certs
mv COMODORSADomainValidationSecureServerCA.crt filebeat/pki/tls/certs/

# Run some tests.
./filebeat/filebeat test config
./filebeat/filebeat test output
