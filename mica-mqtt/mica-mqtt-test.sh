#!/usr/bin/env bash

# Prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
rm -rf mica-mqtt-test
mkdir mica-mqtt-test
cd mica-mqtt-test

# Clone repo
git clone https://gitee.com/dromara/mica-mqtt.git
cd mica-mqtt

# Build jars
mvn package -s ../../../settings.xml

# Run test
cd ..
nohup java -jar mica-mqtt/example/mica-mqtt-server-spring-boot-example/target/mica-mqtt-server-spring-boot-example.jar > /dev/null 2>&1 &
nohup java -jar mica-mqtt/example/mica-mqtt-client-spring-boot-example/target/mica-mqtt-client-spring-boot-example.jar > client.log 2>&1 &
sleep 120s

# End test
pkill -f mica-mqtt-server-spring-boot-example.jar
pkill -f mica-mqtt-client-spring-boot-example.jar
pkill -f math-game.jar

# Test result
# Success Flag: Find topic:/test/123 in client.log
grep "topic:/test/123" mica-mqtt-test/client.log