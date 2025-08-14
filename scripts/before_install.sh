#!/bin/bash
set -euxo pipefail

echo "[before_install] PWD=$(pwd)"
ls -la || true

sudo mkdir -p /home/ec2-user/app
sudo chown ec2-user:ec2-user /home/ec2-user/app

echo "[BeforeInstall] Creating /opt/demo directory and granting permissions"
sudo mkdir -p /opt/demo
sudo chown ec2-user:ec2-user /opt/demo

if ! command -v java >/dev/null 2>&1; then
  sudo yum -y install java-17-amazon-corretto-headless || sudo dnf -y install java-17-amazon-corretto-headless || true
fi

# systemd 관련 로직 제거 (ApplicationStart에서 처리)
