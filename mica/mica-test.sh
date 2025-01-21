#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
rm -rf mica-test
mkdir mica-test
cd mica-test

# Clone repo
git clone --depth=1 -b master https://gitee.com/596392912/mica.git
cd mica

# Run test
mvn clean test

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS