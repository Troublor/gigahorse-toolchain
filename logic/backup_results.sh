#!/bin/bash
echo "compressing files"
tar -hzcf contract_data.tar.gz --exclude='*.facts' --exclude='*.csv' --exclude '*.err' .temp
#rm -rf .temp &
echo "copying archive to remote server"    
scp contract_data.tar.gz contract-library:/srv/contract_data/contract_data.tar.gz &&
echo "extracting archive on remote server"
ssh contract-library "cd /srv/contract_data ; mv .temp .temp.old"
ssh contract-library "cd /srv/contract_data ; nohup tar -xzf contract_data.tar.gz"
