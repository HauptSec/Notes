#! /usr/bin/bash
v=$(curl https://www.splunk.com/en_us/download/splunk-enterprise.html | grep -oE "data-link\=\"https://.*data-md5" | head -1 | grep -oE "splunk-.*\"" | sed "s/splunk-//g" | sed "s/-.*//g")
b=$(curl https://www.splunk.com/en_us/download/splunk-enterprise.html | grep -oE "data-link\=\"https://.*data-md5" | head -1 | grep -oE "splunk-.*\"" | grep -oE "[[:digit:]]-\w+-" | sed 's/^[[:digit:]]-//g' | sed 's/-//g')
wget https://download.splunk.com/products/universalforwarder/releases/"${v}"/linux/splunkforwarder-"${v}"-"${b}"-Linux-x86_64.tgz
tar -C /opt/ -xzf splunkforwarder-"${v}"-"${b}"-Linux-x86_64.tgz
ln -sf /opt/splunkforwarder/bin/splunk /usr/bin/splunk
rm splunk-"${v}"-"${b}"-Linux-x86_64.tgz
splunk start --accept-license
splunk enable boot-start
