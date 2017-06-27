#!/bin/bash

ARGUMENTS=()

if [[ ! -z $HTTP_PORT ]]; then
	ARGUMENTS+=('-httpPort')
	ARGUMENTS+=($HTTP_PORT)
fi

if [[ ! -z $PROTOCOL ]]; then
	ARGUMENTS+=('-protocol')
	ARGUMENTS+=($PROTOCOL)
fi	

if [[ ! -z $DEBUG && $DEBUG ]]; then
	ARGUMENTS+=('-debug')
fi	

if [[ ! -z $NAMED_ONLY && $NAMED_ONLY ]]; then
	ARGUMENTS+=('-namedOnly')
fi	

if [[ ! -z $INFLUX_USERNAME ]]; then
	ARGUMENTS+=('-influxUsername')
	ARGUMENTS+=($INFLUX_USERNAME)
fi	

if [[ ! -z $INFLUX_PASSWORD ]]; then
	ARGUMENTS+=('-influxPassword')
	ARGUMENTS+=($INFLUX_PASSWORD)
fi	

if [[ ! -z $INFLUX_URL ]]; then
	ARGUMENTS+=('-influxURL')
	ARGUMENTS+=($INFLUX_URL)
fi

if [[ ! -z $INFLUX_DATABASE ]]; then
	ARGUMENTS+=('-influxDatabase')
	ARGUMENTS+=($INFLUX_DATABASE)
fi	


exec /usr/local/bin/acurite_to_graph $ARGUMENTS
