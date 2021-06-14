#
# REQUIRES:
#		- site (the forge site instance)
#

# Write A Dummy PHP Info Stub To A Site

rm -rf /home/forge/www.mypocketdoctor.com/public
mkdir -p /home/forge/www.mypocketdoctor.com/public


# Deploy The Proper Stub File Based On Project Type

echo "<?php phpinfo();" > /home/forge/www.mypocketdoctor.com/public/index.php
