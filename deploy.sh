#!/bin/bash
set -e
/etc/init.d/tomcat7 stop
ant deploy -Dskiptests=true
chown -R tomcat7:tomcat7 /var/lib/tomcat7/webapps/rab*
chown -R tomcat7:tomcat7 /home/vagrant/rab-vitro/data-home/
/etc/init.d/tomcat7 start
