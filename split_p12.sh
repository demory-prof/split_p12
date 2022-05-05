# Étape 1

openssl pkcs12 -in sio.manastria.ovh.pfx -out keyStore.pem -nodes -passin pass:netlab123
openssl pkcs12 -in sio.manastria.ovh.pfx -out key.pem -nodes -nocerts -passin pass:netlab123
openssl pkcs12 -in sio.manastria.ovh.pfx -out certificat.pem -nokeys -passin pass:netlab123
