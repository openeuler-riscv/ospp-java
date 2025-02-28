#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
cd test
rm -rf iotdb

# Clone repo
git clone --depth=1 -b v1.3.3 https://gitee.com/apache/iotdb.git
cd iotdb
sed -i '/<module>iotdb-protocol<\/module>/d' pom.xml

# Run test
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS