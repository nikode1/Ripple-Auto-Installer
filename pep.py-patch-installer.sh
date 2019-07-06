#!/bin/bash
set -e
mkdir peppatch
mv master.zip peppatch
cd peppatch
unzip master.zip
cd pep.py-patch-master
yes | cp -rf /root/peppatch/pep.py-patch-master/constants/* /root/ripple/pep.py/constants/
yes | cp -rf /root/peppatch/pep.py-patch-master/events/* /root/ripple/pep.py/events/
yes | cp -rf /root/peppatch/pep.py-patch-master/handlers/* /root/ripple/pep.py/handlers/
yes | cp -rf /root/peppatch/pep.py-patch-master/helpers/* /root/ripple/pep.py/helpers/
yes | cp -rf /root/peppatch/pep.py-patch-master/objects/* /root/ripple/pep.py/objects/
echo --------------------------------------
echo FINISHED. RESTART EVERYTHING
echo --------------------------------------
