# Étape 2

filein=sio.manastria.ovh.pfx


in_filename=$(basename -- "$filein")
in_extension="${in_filename##*.}"
in_filename="${in_filename%.*}"


fileout=${in_filename}


openssl pkcs12 -in "${filein}" -out ${fileout}_both.pem -nodes -passin pass:netlab123
openssl pkcs12 -in "${filein}" -out ${fileout}_key.pem -nodes -nocerts -passin pass:netlab123
openssl pkcs12 -in "${filein}" -out ${fileout}_cert.pem -nokeys -passin pass:netlab123
