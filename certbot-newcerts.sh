#!/bin/bash

RECIPIENT=YOUR-EMAIL-HERE
FROM=certbot@$(hostname)

cat <<-EOF | mail -S from=$FROM -s "Certificates renewed" $RECIPIENT
Host: $(hostname)

Renewed the following certificates:
$(for D in $RENEWED_DOMAINS; do echo "$D"; done)

$(certbot --version 2>&1)
EOF

