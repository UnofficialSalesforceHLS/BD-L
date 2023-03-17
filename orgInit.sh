sfdx force:org:create -f config/project-scratch-def.json -s -d 1 -w 15
sfdx force:source:push --forceoverwrite --loglevel fatal --wait 30
sfdx force:user:create -a BDLAdmin -f users/bdl_admin.json
sfdx force:user:permset:assign -n BDL_BDL_Admin
sfdx shane:user:password:set -g User -l User -p iLoveSalesforceBDL2023
sfdx shane:user:password:set -g BDL -l Admin -p iLoveSalesforceBDL2023
sfdx force:org:open



