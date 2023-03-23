bold=$(tput bold)
normal=$(tput sgr0)

echo ${bold}Create Scratch Org $1${normal}
echo sfdx force:org:create -f config/project-scratch-def.json --setalias $1 --setdefaultusername --durationdays $2 --targetdevhubusername bayerdemo
sfdx force:org:create -f config/project-scratch-def.json --setalias $1 --setdefaultusername --durationdays $2 --targetdevhubusername bayerdemo
sleep 5
echo -e

echo ${bold}Push Package${normal}
echo sfdx force:source:push --forceoverwrite --loglevel fatal --wait 30
sfdx force:source:push --forceoverwrite --loglevel fatal --wait 30
echo -e

echo ${bold}Create BDL User${normal}
echo sfdx force:user:create -a BDLAdmin -f users/bdl_admin.json
sfdx force:user:create -a BDLAdmin -f users/bdl_admin.json
echo -e

echo ${bold}Assign Permission Set${normal}
echo sfdx force:user:permset:assign -n BDL_BDL_Admin
sfdx force:user:permset:assign -n BDL_BDL_Admin
echo -e

echo ${bold}Import Data${normal}
echo sfdx texei:data:import --inputdir ./data
sfdx texei:data:import --inputdir ./data
echo -e

echo ${bold}Open Scratch Org: $1${normal}
echo sfdx force:org:open
sfdx force:org:open
