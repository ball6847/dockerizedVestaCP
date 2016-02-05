#!/bin/bash

export TERM=xterm

function setup_watcher {
  while true
  do
    inotifywait -r -e modify /etc/passwd /etc/shadow /etc/group && cp -f /etc/{passwd,shadow,group} /vesta/
  done
}

# use userdb if possible
for file in "passwd group shadow"
do
    if [ -f /vesta/$file ]; then
        cp -f /vesta/$file /etc/$file
    else
        cp -f /etc/$file /vesta/$file
    fi
done

# now setup watcher
setup_watcher &

if [ -z "`ls /vesta --hide='lost+found'`" ]
then
	rsync -a /vesta-start/* /vesta
fi

#starting Vesta
/etc/init.d/vesta start
/etc/init.d/mysql start
/etc/init.d/nginx start
/etc/init.d/exim4 start
# /etc/init.d/apache2 start
/etc/init.d/bind9 start
/etc/init.d/dovecot start
/etc/init.d/php5-fpm start
