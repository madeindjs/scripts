#!/bin/bash
#
#Activate / descativate Xdebug

if php -m -c | grep -q xdebug
then
	sudo phpdismod xdebug
	echo "[x] XDebug disabled"
else
	echo "[x] XDebug Enabled"
	sudo phpenmod xdebug
fi
sudo /etc/init.d/apache2 restart > /dev/null
echo "[x] Apache restarted"