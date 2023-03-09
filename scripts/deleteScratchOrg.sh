bold=$(tput bold)
normal=$(tput sgr0)

echo ${bold}Delete Scratch Org: $1${normal}
echo sfdx force:org:delete -u $1
sfdx force:org:delete -u $1 
