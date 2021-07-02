#!/bin/bash
# setting up prerequisites

bin/elasticsearch-plugin install ingest-attachment
bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.3.2/elasticsearch-analysis-ik-7.3.2.zip


exec /usr/local/bin/docker-entrypoint.sh elasticsearch
