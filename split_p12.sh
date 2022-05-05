# Étape 6 : Vérifier la présence du fichier PKCS#12 avant de l'extraire.

# De la couleur
RED='\033[0;31m'
NC='\033[0m' # No Color

# Nom du fichier en entrée
filein="$1"

# Test si le fichier en entrée existe
if [ ! -f ${filein} ]; then
    echo -e "${RED}Le fichier '${filein}' n'existe pas...${NC}" >&2
    # Un code de retour != 0 indique une erreur
    exit 1
fi

# Nom du fichier sans l'extension
# Voir la documentation : https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html, https://www.quennec.fr/trucs-astuces/syst%C3%A8mes/gnulinux/programmation-shell-sous-gnulinux/aspects-avanc%C3%A9s-de-la-programmation-shell/substitution-de-variables
in_filename=$(basename -- "$filein")
in_extension="${in_filename##*.}"           # Exclure tout jusqu'au dernier point (à partir de la gauche)
in_filename="${in_filename%.*}"             # Exclure tout jusqu'au premier point (en partant de la droite)

# Nom du fichier en sortie (sans extension)
fileout=${in_filename}

# Répertoires pour la publication des certificats
rep_public="/etc/ssl/certs"
rep_private="/etc/ssl/private"

# Mots de passe
password=$2

# Generation des certificats
openssl pkcs12 -in "${filein}" -out "${rep_private}/${fileout}_both.pem" -nodes -passin pass:${password}
openssl pkcs12 -in "${filein}" -out "${rep_private}/${fileout}_key.pem" -nodes -nocerts -passin pass:${password}
openssl pkcs12 -in "${filein}" -out "${rep_public}/${fileout}_cert.pem" -nokeys -passin pass:${password}
