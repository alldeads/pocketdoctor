set -e
echo $(date)
if [ ! -f /tmp/fpmlock ]
then
    touch /tmp/fpmlock
    chmod 666 /tmp/fpmlock
fi

cd /home/forge/www.mypocketdoctor.com
git pull origin master
/usr/bin/php7.3 /usr/local/bin/composer install --no-interaction --prefer-dist --optimize-autoloader

if [ -f artisan ]
then
    /usr/bin/php7.3 artisan migrate --force
    /usr/bin/php7.3 artisan view:clear
    /usr/bin/php7.3 artisan queue:restart
fi

curl -X POST "https://api.cloudflare.com/client/v4/zones/94a0aeeca7d0ad4ab8f4a651fc8622a6/purge_cache" \
     -H "X-Auth-Email: awkwardusername@gmail.com" \
     -H "X-Auth-Key: 23fd38b23107af4c5533d6c141ddc86b0bb05" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}'
