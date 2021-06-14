set -e
echo $(date)
if [ ! -f /tmp/fpmlock ]
then
    touch /tmp/fpmlock
    chmod 666 /tmp/fpmlock
fi

FORGE_COMPOSER='php7.2 /usr/local/bin/composer'
FORGE_CUSTOM_DEPLOY='1'
FORGE_DEPLOY_AUTHOR='N/A'
FORGE_DEPLOY_COMMIT='N/A'
FORGE_DEPLOY_MESSAGE='N/A'
FORGE_MANUAL_DEPLOY='0'
FORGE_PHP='php7.2'
FORGE_PHP_FPM='php7.2-fpm'
FORGE_QUICK_DEPLOY='0'
FORGE_REDEPLOY='0'
FORGE_SERVER_ID='276242'
FORGE_SITE_BRANCH='master'
FORGE_SITE_ID='740309'
FORGE_SITE_PATH='/home/forge/www.mypocketdoctor.com'
FORGE_SITE_USER='forge'


cd /home/forge/www.mypocketdoctor.com
git pull origin master
/usr/bin/php7.1 /usr/local/bin/composer install --no-interaction --prefer-dist --optimize-autoloader

if [ -f artisan ]
then
    /usr/bin/php7.1 artisan migrate --force
    /usr/bin/php7.1 artisan view:clear
    /usr/bin/php7.1 artisan queue:restart
fi

sudo service php7.1-fpm reload


curl -X POST "https://api.cloudflare.com/client/v4/zones/94a0aeeca7d0ad4ab8f4a651fc8622a6/purge_cache" \
     -H "X-Auth-Email: awkwardusername@gmail.com" \
     -H "X-Auth-Key: 23fd38b23107af4c5533d6c141ddc86b0bb05" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}'
