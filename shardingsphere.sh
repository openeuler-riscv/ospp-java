#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
cd test
rm -rf sharding-sphere

# Clone repo
git clone --depth=1 -b 5.5.1 https://gitee.com/Sharding-Sphere/sharding-sphere.git
cd sharding-sphere
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.21.12 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-linux-riscv64.exe
mvn install:install-file -DgroupId=io.grpc -DartifactId=protoc-gen-grpc-java -Dversion=1.65.1 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-gen-grpc-java-linux-riscv_64.exe
sed -i '/<module>db-protocol<\/module>/d' pom.xml
sed -i '/<module>protocol<\/module>/d' kernel/data-pipeline/scenario/cdc/pom.xml

# Run test
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS