#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
cd test
rm -rf pulsar

# Clone repo
git clone --depth=1 -b v4.0.2 https://gitee.com/ospp-java-apache-mirrors/pulsar.git
cd pulsar
sed -i 's/<os-maven-plugin.version>1.7.0<\/os-maven-plugin.version>/<os-maven-plugin.version>1.7.1<\/os-maven-plugin.version>/' pom.xml
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.25.5 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-linux-riscv64.exe
mvn install:install-file -DgroupId=io.grpc -DartifactId=protoc-gen-grpc-java -Dversion=1.56.1 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-gen-grpc-java-linux-riscv_64.exe

# Run test
mvn clean install -Pcore-modules,-main -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS