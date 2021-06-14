set -e
echo $(date)

cd /home/forge/www.mypocketdoctor.com
git pull origin master
composer install --no-interaction --prefer-dist --optimize-autoloader
echo "" | sudo -S service php7.1-fpm reload

if [ -f artisan ]
then
    php artisan migrate --force
    php artisan view:clear
    php artisan queue:restart
    php artisan config:cache
fi

curl -X POST "https://api.cloudflare.com/client/v4/zones/94a0aeeca7d0ad4ab8f4a651fc8622a6/purge_cache" \
     -H "X-Auth-Email: awkwardusername@gmail.com" \
     -H "X-Auth-Key: 23fd38b23107af4c5533d6c141ddc86b0bb05" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}'
