#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
cd test
rm -rf linkis

# Clone repo
if [ ! -f "apache-streampark-2.1.5-incubating-src.tar.gz" ]; then
  wget https://mirrors.tuna.tsinghua.edu.cn/apache/streampark/2.1.5/apache-streampark-2.1.5-incubating-src.tar.gz
fi
rm -rf apache-streampark-2.1.5-incubating-src
tar -xzvf apache-streampark-2.1.5-incubating-src.tar.gz
cd apache-streampark-2.1.5-incubating-src

# Run test
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B
# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS