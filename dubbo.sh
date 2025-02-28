#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
cd test
rm -rf dubbo

# Clone repo
git clone --depth=1 -b dubbo-3.3.0 https://gitee.com/apache/dubbo.git
cd dubbo
cp /usr/bin/protoc protoc.exe
git apply ../../lib/Add-riscv-support-for-dubbo.patch
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.25.0 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=protoc.exe
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.22.3 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=protoc.exe
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.7.1 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-linux-riscv64.exe
mvn install:install-file -DgroupId=io.grpc -DartifactId=protoc-gen-grpc-java -Dversion=1.54.0 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-gen-grpc-java-linux-riscv_64.exe
mvn install:install-file -DgroupId=io.grpc -DartifactId=protoc-gen-grpc-java -Dversion=1.66.0 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-gen-grpc-java-linux-riscv_64.exe

# Run test
mvn clean package -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS