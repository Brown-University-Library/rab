rab
===========

Repository containing code for [Researchers@Brown](https://vivo.brown.edu/), built with the [VIVO/Vitro platform](https://github.com/vivo-project).


## Pre-requisites
In order to compile and run an instance of VIVO you'll need MySQL,
Tomcat, and Ant.

You can install Tomcat and MySQL via `apt-get` on Linux or via Homebrew on a Mac.

You can get Ant from the Apache web site: http://ant.apache.org/bindownload.cgi,
extract it, copy it to a folder under `/usr/local/bin/`,
and add it to your path.

```
tar -xvzf apache-ant-1.9.7-bin.tar.gz
mv apache-ant-1.9.7-bin/ /usr/local/bin/ant/
# add /usr/local/bin/ant/bin to your PATH
```

## Setup
Setup a database for use with Vitro

```
CREATE USER 'vivouser'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON * . * TO 'vivouser'@'localhost';

CREATE DATABASE vivodev DEFAULT CHARACTER SET utf8;
```

Get the code for this repository and for Vitro.

```
git clone git@github.com:Brown-University-Library/rab.git
cd rab
git clone --branch maint-rel-1.8 https://github.com/vivo-project/Vitro.git
```

Create config files for Ant to use when you compile and deploy
the application. You can start with the sample files provided.

```
cp example.build.properties build.properties
cp example.deploy.properties deploy.properties
```

Make sure to update the `tomcat.home` and `vitro.home` in `build.properties` files to match your environment. Also, make sure
`tomcat.home` and `vitro.home.directory` in `deploy.properties`
match your environment.

Create the Vitro data directory that you indicated in `vitro.home`
and copy `runtime.properties` there. Make sure the
`VitroConnection.DataSource.url|username|password` properties match
the MySQL database that you created.

```
mkdir -p /usr/local/vivo/data
cp example.runtime.properties /usr/local/vivo/data
```

If Tomcat is running as a daemon on your machine you can adjust
`rebuild.sh` to match your machine and then run `sudo ./rebuild.sh`

If Tomcat is not running as a daemon you can manually run Ant
to compile and deploy the binaries, and then start Tomcat.

   ```
   ant all -Dskiptests=true
   cd /path/to/tomcat
   bin/catalina run
   ```

And browse to http://localhost:8080/vivo/ to look at the site.
