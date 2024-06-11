#! /usr/local/sbin/opnsense-shell
opnsense-code ports
cd /usr/ports/security/tailscale
make install
service tailscaled enable
service tailscaled start
tailscale up --login-server https://controlplane.tailscale.com \
--authkey AUTHKEY \
--accept-routes \
--advertise-routes=SUBNETCIDR \
--force-reauth
tailscale status
