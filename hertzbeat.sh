#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
cd test
rm -rf hertzbeat

# Clone repo
git clone --depth=1 -b v1.6.1 https://gitee.com/ospp-java-apache-mirrors/hertzbeat.git
cd hertzbeat

# Run test
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS