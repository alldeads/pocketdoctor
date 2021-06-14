#
# REQUIRES:
#		- site (the forge site instance)
#

# Write A Dummy PHP Info Stub To A Site

rm -rf /home/forge/mypocketdoctor.com/public
mkdir -p /home/forge/mypocketdoctor.com/public


# Deploy The Proper Stub File Based On Project Type

echo "<?php phpinfo();" > /home/forge/mypocketdoctor.com/public/index.php
