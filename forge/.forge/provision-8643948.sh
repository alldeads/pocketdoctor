#
# REQUIRES:
#       - name (the name of the SSH Key)
#

sed -i "/# mark-2$/,+1d" /home/forge/.ssh/authorized_keys
