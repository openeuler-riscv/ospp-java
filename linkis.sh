#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
cd test
rm -rf linkis

# Clone repo
git clone --depth=1 -b 1.7.0 https://gitee.com/ospp-java-apache-mirrors/linkis.git
cd linkis

# Run test
mvn -N install
mvn clean install -DskipTests -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS