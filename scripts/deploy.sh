#!/usr/bin/env bash
set -e

apt update
apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
echo '{"version": "'$(git rev-parse HEAD)'"}' > version.json
rm -Rf .git*
bundle install
puma -d

bundle install

gem install bundler

mv /tmp/puma.service /etc/systemd/system/puma.service

systemctl daemon-reload
systemctl start puma
systemctl enable puma
systemctl status puma

