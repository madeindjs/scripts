#!/bin/bash

START='phpSettings.error_reporting = E_ALL & ~E_STRICT'
END='& ~E_DEPRECATED & ~E_NOTICE'


if [[ -z $1 ]]; then
	# activate error reporting
	# so we remove leading `~E_DEPRECATED & ~E_NOTICE`
	sed  -iE "s/(^${START}) ${END}.*/\1/" application/default/configs/application.ini
else
	# desactivate error reporting
	# so we add leading `~E_DEPRECATED & ~E_NOTICE`
	sed  -iE "s/(^${START}).*/\1 \& ~E_DEPRECATED \& ~E_NOTICE/" application/default/configs/application.ini
fi
# search all translations for the given key / value
