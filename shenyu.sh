#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
cd test
rm -rf cd shenyu

# Clone repo
git clone --depth=1 -b v2.6.0 https://gitee.com/Apache-ShenYu/shenyu.git
cd shenyu

# Run test
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS