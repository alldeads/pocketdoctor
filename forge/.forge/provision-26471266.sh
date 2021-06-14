#
# REQUIRES:
#		- site (the forge site instance)
#

# Write A Dummy PHP Info Stub To A Site

rm -rf /home/forge/cdn.mypocketdoctor.com/
mkdir -p /home/forge/cdn.mypocketdoctor.com/


# Deploy The Proper Stub File Based On Project Type

echo "<?php phpinfo();" > /home/forge/cdn.mypocketdoctor.com//index.php
