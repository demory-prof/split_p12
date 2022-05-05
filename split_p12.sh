openssl pkcs12 -in sio.manastria.ovh.pfx -out keyStore.pem -nodes
openssl pkcs12 -in sio.manastria.ovh.pfx -out key.pem -nodes -nocerts
openssl pkcs12 -in sio.manastria.ovh.pfx -out certificat.pem -nokeys
