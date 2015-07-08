rab
===========

Repository containing code for [Researchers@Brown](https://vivo.brown.edu/), built with the [VIVO/Vitro platform](https://github.com/vivo-project).

###Setup

 * setup a database for use with Vitro: `create database vitro charset DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci`
 * git clone this repository
 * `git clone --branch maint-rel-1.7 https://github.com/vivo-project/Vitro.git`
 * make a vitro data directory
 * adjust build.properties and runtime.properties to match your machine
 * adjust rebuild.sh to match your matchine
 * run `sudo ./rebuild.sh`
