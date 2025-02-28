#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
cd test
rm -rf skywalking

# Clone repo
git clone --depth=1 -b v10.1.0 https://gitee.com/ospp-java-apache-mirrors/skywalking.git
cd skywalking
rm -rf .gitmodules
cp ../../lib/skywalking-gitmodules .gitmodules
git submodule init
git submodule update
sed -i 's/<os-maven-plugin.version>1.6.2<\/os-maven-plugin.version>/<os-maven-plugin.version>1.7.1<\/os-maven-plugin.version>/' pom.xml
sed -i 's/<os-maven-plugin.version>1.5.0.Final<\/os-maven-plugin.version>/<os-maven-plugin.version>1.7.1<\/os-maven-plugin.version>/' test/e2e-v2/java-test-service/e2e-protocol/pom.xml
sed -i 's/<os-maven-plugin.version>1.5.0.Final<\/os-maven-plugin.version>/<os-maven-plugin.version>1.7.1<\/os-maven-plugin.version>/' test/e2e-v2/java-test-service/opentelemetry-proto/pom.xml
sed -i '/<id>ui<\/id>/,/<activeByDefault>true<\/activeByDefault>/ s/<activeByDefault>true<\/activeByDefault>/<activeByDefault>false<\/activeByDefault>/' pom.xml
sed -i '/<module>receiver-proto<\/module>/d' oap-server/server-receiver-plugin/pom.xml
sed -i '/<module>aws-firehose-receiver<\/module>/d' oap-server/server-receiver-plugin/pom.xml
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.19.2 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-linux-riscv64.exe
mvn install:install-file -DgroupId=io.grpc -DartifactId=protoc-gen-grpc-java -Dversion=1.42.1 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-gen-grpc-java-linux-riscv_64.exe

# Run test
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS