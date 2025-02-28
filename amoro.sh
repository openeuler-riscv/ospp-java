#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
cd test
rm -rf amoro

# Clone repo
git clone --depth=1 -b v0.7.1-incubating https://gitee.com/ospp-java-apache-mirrors/amoro.git
cd amoro

# Run test
mvn clean test-compile -Pskip-dashboard-build -Pno-extented-disk-storage \
-DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS