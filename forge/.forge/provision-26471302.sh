#
# REQUIRES:
#       - site (the forge site instance)
#       - repository (the repository to deploy)
#		- composer (determines if composer install will be run)
#		- migrate (determines if migrate will be run)
#

set -e


# Remove The Current Site Directory

rm -rf /home/forge/cdn.mypocketdoctor.com

ssh-keyscan -H git.coreproc.com:38085 >> /home/forge/.ssh/known_hosts

# Clone The Repository Into The Site

git clone -b master ssh://git@git.coreproc.com:38085/mediaxes/mypocketdoctor-cdn.git cdn.mypocketdoctor.com

cd /home/forge/cdn.mypocketdoctor.com

git submodule update --init --recursive

# Install Composer Dependencies If Requested


# Run Artisan Migrations If Requested


# Create Environment File If Necessary

if [ -f /home/forge/cdn.mypocketdoctor.com/artisan ]
then

    if [ -f /home/forge/cdn.mypocketdoctor.com/.env.example ]
    then
        cp /home/forge/cdn.mypocketdoctor.com/.env.example /home/forge/cdn.mypocketdoctor.com/.env
    else
        cat > /home/forge/cdn.mypocketdoctor.com/.env << EOF
APP_ENV=production
APP_KEY=
APP_DEBUG=false
APP_LOG_LEVEL=debug
APP_URL=http://localhost

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=
DB_USERNAME=forge
DB_PASSWORD=lLGmEhaiMrAJpdIlVrHD

BROADCAST_DRIVER=log
CACHE_DRIVER=file
SESSION_DRIVER=file
QUEUE_DRIVER=sync

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null

PUSHER_KEY=
PUSHER_SECRET=
PUSHER_APP_ID=
EOF
    fi

    sed -i -r "s/APP_ENV=.*/APP_ENV=production/" /home/forge/cdn.mypocketdoctor.com/.env
    sed -i -r "s/APP_DEBUG=.*/APP_DEBUG=false/" /home/forge/cdn.mypocketdoctor.com/.env
    sed -i -r "s/DB_DATABASE=.*/DB_DATABASE=forge/" /home/forge/cdn.mypocketdoctor.com/.env
    sed -i -r "s/DB_USERNAME=.*/DB_USERNAME=forge/" /home/forge/cdn.mypocketdoctor.com/.env
    sed -i -r "s/DB_PASSWORD=.*/DB_PASSWORD=lLGmEhaiMrAJpdIlVrHD/" /home/forge/cdn.mypocketdoctor.com/.env
    php /home/forge/cdn.mypocketdoctor.com/artisan key:generate || true
fi
