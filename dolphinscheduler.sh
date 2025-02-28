#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
cd test
rm -rf DolphinScheduler

# Clone repo
git clone --depth=1 -b 3.1.9 https://gitee.com/dolphinscheduler/DolphinScheduler.git
cd DolphinScheduler

# Run test
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS