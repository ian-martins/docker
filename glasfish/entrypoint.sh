#!/bin/bash
set -e
cd glassfish7/glassfish/bin

if [ ! -f "password-configured" ]; then
echo "==> Configurando senha do admin..."
echo "AS_ADMIN_PASSWORD=" > /tmp/pass
echo "AS_ADMIN_NEWPASSWORD=admin" >> /tmp/pass
echo "AS_ADMIN_NEWPASSWORD_CONFIRM=admin" >> /tmp/pass

./asadmin start-domain -d domain1
./asadmin change-admin-password --user admin --passwordfile /tmp/pass
rm /tmp/pass

touch "password-configured"
fi

if [ ! -f "secure-configured" ]; then
echo "AS_ADMIN_PASSWORD=admin" > ./password
echo "==> Habilitando secure admin..."

./asadmin --user admin --passwordfile ./password enable-secure-admin
rm ./password

touch "secure-configured"

fi

./asadmin stop-domain domain1
./asadmin start-domain -v domain1

