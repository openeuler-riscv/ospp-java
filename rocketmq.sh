#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
cd test
rm -rf rocketmq

# Clone repo
git clone --depth=1 -b release-5.3.1 https://gitee.com/apache/rocketmq.git
cd rocketmq

# Run test
mvn clean test-compile -DskipTests -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS