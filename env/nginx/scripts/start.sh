# Any extra start up scripts here to run on container instantiation
#!/bin/bash

CONF="/etc/nginx/conf.d/naturalremedy.co.uk.template"
CONF_DEFAULT="/etc/nginx/conf.d/default.conf"
ENV="/etc/nginx/.env"

# Update Nginx config depending on environment files
if [ -f $ENV ]; then
	export $(grep -v '^#' $ENV | xargs)
	
	if [ -z ${TEMPLATE+x} ]; then
		echo "TEMPLATE not set!"
		exit 1
	fi

	if [ -f $CONF_DEFAULT ]; then
		rm $CONF_DEFAULT
	fi

	# Update CONF to match current domain env
	if [ ! -f $CONF ]; then
		CONF="/etc/nginx/conf.d/$TEMPLATE.template"
	fi

	cp $CONF $CONF_DEFAULT
	sed -i -e "s/{TEMPLATE}/${TEMPLATE}/g" $CONF_DEFAULT
	echo # \n
	cat $CONF_DEFAULT
	echo # \n

	# Restart web server in Docker mode
	nginx -g "daemon off;"
else
	echo "Error: no /etc/nginx/.env environment variables file found!"
	exit 1
fi
