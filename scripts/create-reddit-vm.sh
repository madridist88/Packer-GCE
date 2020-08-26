#!/bin/bash

gcloud compute instances create reddit-app2\
  --boot-disk-size=10GB \
  --image-family reddit-full \
  --image-project=infra-208405 \
  --machine-type=f1-micro \
  --tags puma-server \
  --restart-on-failure


gcloud compute --project=infra-208405 firewall-rules create reddit-app2 --description=description --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:9292 --source-ranges=0.0.0.0/0
