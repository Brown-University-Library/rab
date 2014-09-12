#!/bin/sh -e

set -x # Print commands and their arguments as they are executed.

#JETTY_HOME=/home/vagrant/jetty9
JETTY_HOME=/usr/local/jetty7.6.14
VITRO_HOME=/tmp/vitrohub
STAGE_DIR=/tmp/vbuild
PORT=5000

if [ $1 = "clean" ]
then
 ant clean distribute -Dskiptests=true
else
 ant distribute -Dskiptests=true
fi

mkdir -p $STAGE_DIR
tar -xvf .build/distribution.tar.gz -C $STAGE_DIR
tar -xvf $STAGE_DIR/vitrohome.tar -C $VITRO_HOME/
mkdir -p $VITRO_HOME/solr/
tar -xvf $STAGE_DIR/solrhome.tar -C $VITRO_HOME/solr/

mv $STAGE_DIR/*war $JETTY_HOME/webapps/.

cd $JETTY_HOME
java -jar start.jar -Djetty.port=$PORT -Dsolr.solr.home=$VITRO_HOME/solr 
#-Dvitro.home=$VITRO_HOME
