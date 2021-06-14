#
# REQUIRES:
#       - name (the name of the SSH Key)
#

sed -i "/# mark$/,+1d" /home/forge/.ssh/authorized_keys
