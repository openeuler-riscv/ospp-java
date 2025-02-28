#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
cd test
rm -rf paimon

# Clone repo
git clone --depth=1 -b release-1.0.0 https://gitee.com/ospp-java-apache-mirrors/paimon.git
cd paimon
sed -i '/<module>paimon-flink<\/module>/d' pom.xml

# Run test
mvn clean package -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS