#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
cd test
rm -rf fury

# Clone repo
git clone --depth=1 -b releases-0.10 https://gitee.com/ospp-java-apache-mirrors/fury.git
cd fury

# Run test
cd java
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS