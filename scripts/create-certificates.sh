#!/bin/bash

echo 'Starting reverse proxy...'
docker compose -f docker-compose-certs.yml up ngnix_rev_proxy -d
echo 'Starting reverse proxy...DONE'

echo 'waiting for 20 second to make reverse proxy operative...'
sleep 20
echo 'wait finished'

CONTACT_MAIL={ADD_YOUR_EMAIL_ADDRESS}
DOMAIN_NAME={ADD_YOUR_DOMAIN_ADDRESS}

echo "contact email: $CONTACT_MAIL"

echo "Requesting certificate for $DOMAIN_NAME..."
docker compose -f docker-compose-certs.yml run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --agree-tos --renew-by-default --non-interactive --email $CONTACT_MAIL --no-eff-email -d $DOMAIN_NAME
echo "Requesting certificate for $DOMAIN_NAME...DONE"

echo 'Process completed...'
