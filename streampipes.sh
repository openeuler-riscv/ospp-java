#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
cd test
rm -rf linkis

# Clone repo
if [ ! -f "apache-streampipes-0.97.0-source-release.zip" ]; then
  wget https://mirrors.tuna.tsinghua.edu.cn/apache/streampipes/0.97.0/apache-streampipes-0.97.0-source-release.zip
fi
rm -rf apache-streampipes-0.97.0
unzip apache-streampipes-0.97.0-source-release.zip
cd apache-streampipes-0.97.0
mvn install:install-file -Dfile=../../lib/disruptor-3.4.2.wso2v1.jar -DpomFile=../../lib/disruptor-3.4.2.wso2v1.pom
mvn install:install-file -Dfile=../../lib/org.eclipse.osgi.services-3.3.100.v20130513-1956.jar -DpomFile=../../lib/org.eclipse.osgi.services-3.3.100.v20130513-1956.pom

# Run test
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B
# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS