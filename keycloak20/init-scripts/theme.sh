#!/bin/bash
echo "Configuring the talentum theme"
KEYCLOAK_CONF_FILE="standalone-ha.xml"
sh /opt/bitnami/keycloak/bin/jboss-cli.sh <<EOF
embed-server --server-config=${KEYCLOAK_CONF_FILE} --std-out=discard
batch
/subsystem=keycloak-server/theme=defaults:write-attribute(name=welcomeTheme,value=talentum)
/subsystem=keycloak-server/theme=defaults:write-attribute(name=default,value=talentum)
run-batch
stop-embedded-server
EOF
