#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
cd test
rm -rf incubator-hugegraph

# Clone repo
git clone --depth=1 -b 1.5.0 https://gitee.com/ospp-java-apache-mirrors/incubator-hugegraph.git
cd incubator-hugegraph
sed -i 's/<os.plugin.version>1.6.0<\/os.plugin.version>/<os.plugin.version>1.7.1<\/os.plugin.version>/g' hugegraph-pd/hg-pd-grpc/pom.xml
sed -i 's/<os.plugin.version>1.6.2<\/os.plugin.version>/<os.plugin.version>1.7.1<\/os.plugin.version>/g' hugegraph-store/hg-store-grpc/pom.xml
sed -i 's/<version>1.5.0.Final<\/version>/<version>1.7.1<\/version>/g' hugegraph-server/hugegraph-core/pom.xml
sed -i '/<module>hugegraph-pd<\/module>/d' pom.xml
sed -i '/<module>install-dist<\/module>/d' pom.xml 
sed -i '/<module>hugegraph-store<\/module>/d' pom.xml
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.17.2 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-linux-riscv64.exe
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.21.7 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-linux-riscv64.exe
mvn install:install-file -DgroupId=io.grpc -DartifactId=protoc-gen-grpc-java -Dversion=1.39.0 -Dclassifier=linux-riscv64 -Dpackaging=exe -Dfile=../../lib/protoc-gen-grpc-java-linux-riscv_64.exe

# Run test
mvn clean package -DskipTests -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS