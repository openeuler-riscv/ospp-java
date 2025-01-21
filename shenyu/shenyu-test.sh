#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
rm -rf shenyu-test
mkdir shenyu-test
cd shenyu-test

# Clone repo
git clone --depth=1 -b master https://gitee.com/Apache-ShenYu/shenyu.git
cd shenyu

# Run test
mvn clean package -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS