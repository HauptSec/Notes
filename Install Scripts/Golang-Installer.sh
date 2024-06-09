#! /usr/bin/bash
v=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version')
wget https://go.dev/dl/"${v}".linux-amd64.tar.gz
tar -C /usr/local -xzf "${v}".linux-amd64.tar.gz
ln -sf /usr/local/go/bin/go /usr/bin/go
rm "${v}".linux-amd64.tar.gz
