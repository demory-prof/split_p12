# Étape 2


# Nom du fichier en entrée
filein=sio.manastria.ovh.pfx

# Nom du fichier sans l'extension
# Voir la documentation : https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html, https://www.quennec.fr/trucs-astuces/syst%C3%A8mes/gnulinux/programmation-shell-sous-gnulinux/aspects-avanc%C3%A9s-de-la-programmation-shell/substitution-de-variables
in_filename=$(basename -- "$filein")
in_extension="${in_filename##*.}"           # Exclure tout jusqu'au dernier point (à partir de la gauche)
in_filename="${in_filename%.*}"             # Exclure tout jusqu'au premier point (en partant de la droite)

# Nom du fichier en sortie (sans extension)
fileout=${in_filename}

# Generation des certificats
openssl pkcs12 -in "${filein}" -out ${fileout}_both.pem -nodes -passin pass:netlab123
openssl pkcs12 -in "${filein}" -out ${fileout}_key.pem -nodes -nocerts -passin pass:netlab123
openssl pkcs12 -in "${filein}" -out ${fileout}_cert.pem -nokeys -passin pass:netlab123
