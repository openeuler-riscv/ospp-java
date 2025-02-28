#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
cd test
rm -rf incubator-seata

# Clone repo
git clone --depth=1 -b v2.3.0 https://gitee.com/ospp-java-apache-mirrors/incubator-seata.git
cd incubator-seata
sed -i '/<module>console<\/module>/d' pom.xml
sed -i '/<module>server<\/module>/d' pom.xml
sed -i '/<module>ext\/apm-seata-skywalking-plugin<\/module>/d' pom.xml
sed -i '/<module>test<\/module>/d' pom.xml
sed -i 's/<os-maven-plugin.version>1.5.0.Final<\/os-maven-plugin.version>/<os-maven-plugin.version>1.7.1<\/os-maven-plugin.version>/g' build/pom.xml
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.25.4 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=/usr/bin/protoc
mvn install:install-file -DgroupId=io.grpc -DartifactId=protoc-gen-grpc-java -Dversion=1.55.1 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-gen-grpc-java-linux-riscv_64.exe

# Run test
mvn clean test-compile -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS