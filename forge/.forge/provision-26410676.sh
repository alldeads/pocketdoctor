#
# REQUIRES:
#       - name (the name of the SSH Key)
#		- key (the key text)
#

echo "# mark" | tee -a /home/forge/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPX177JdarCsvUuAH9tj+hSznHrAa1uG2w5KxcmxEIaLxmuiBj4dKx06xzMOaOb1R8P3wMj2GQTsbX93b0H0qT4ZGV3kgDJuo3LjskYVvWiO/rX8MbaJ6SVIQkVm0c+bqXJTX+MxkzAyXayT529A2ds/QcDP5vds+FiZB/mPQy1taJ+uetaXI7EcrOzkxAZvkr/IgnIizUASXsgB2hQGFCA/SWvmqgPe1Ok0k1SKXHfTsRTThmVupnodEe5iiY4IAjV/V633Q3CWo1mQsfIG/ra1pjkH+BnsWX/JKcwtjeJkaZtTsr6Bm2HMxus42cUgKEYrYeNiLLQYp6mSHeoJ4J" | tee -a /home/forge/.ssh/authorized_keys
