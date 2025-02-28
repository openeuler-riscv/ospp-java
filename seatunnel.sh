#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
cd test
rm -rf SeaTunnel

# Clone repo
git clone --depth=1 -b 2.3.9 https://gitee.com/seatunnel/SeaTunnel.git
cd SeaTunnel
mvn install:install-file -Dfile=../../lib/hadoop-huaweicloud-3.1.1.29.jar -DpomFile=../../lib/hadoop-huaweicloud-3.1.1.29.pom
mvn install:install-file -Dfile=../../lib/esdk-obs-java-3.19.7.3.jar -DpomFile=../../lib/esdk-obs-java-3.19.7.3.pom
sed -i '/<module>seatunnel-engine-ui<\/module>/d' seatunnel-engine/pom.xml

# Run test
mvn clean package -pl seatunnel-dist -am -DskipTests -T1C -Dmaven.javadoc.skip=true -B

# Test result
# Success Flag: 
# [INFO] BUILD SUCCESS