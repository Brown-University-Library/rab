rab-vitro
===========

###10/20/04
This is a repo for upgrading Researchers@Brown to the VIVO/Vitro 1.7 platform.  We are investigating using Vitro for the code core and then adding our ontology, custom listViews, and custom templates.  

###Building

 * setup a database for use with Vitro: `create database vitro charset "utf8"`
 * git clone this repository
 * `git clone --depth 5 --branch maint-rel-1.7 https://github.com/vivo-project/Vitro.git`
 * make a vitro data directory
 * adjust build.properties and runtime.properties to match your machine
 * adjust rebuild.sh to match your matchine
 * run `sudo ./rebuild.sh`
