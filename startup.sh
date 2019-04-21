#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Run a case command
case $1 in
    server)

    WEBSITE_BASE_NAME="$(printenv WEBSITE_NAME)"
    BASE_PATH=/var/www/${WEBSITE_BASE_NAME}


    if [ -e $BASE_PATH/requirements.txt ] && [ ! -d $BASE_PATH/env ]; then
        sudo pip3 install virtualenv
        cd $BASE_PATH
        virtualenv env
        source $BASE_PATH/env/bin/activate
        pip install -r $BASE_PATH/requirements.txt
        else
            source $BASE_PATH/env/bin/activate
    fi

    cd $BASE_PATH
    python manage.py makemigrations
    python manage.py migrate
    echo "Made Migrations..."
    python manage.py collectstatic --noinput
    sudo apache2ctl -D FOREGROUND
#    echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@myproject.com', 'password')" | python manage.py shell
    ;;

esac