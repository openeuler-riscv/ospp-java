### Prepare

#### OS
- openEuler 24.03 (LTS) for RISC-V

#### Dependence
```
sudo dnf install java-21-openjdk-devel 
sudo dnf install maven
```

#### Set default Java
```
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
```

#### Check preparation
```
$ mvn -version                                
Apache Maven 3.6.3 (openEuler 3.6.3-2)
Maven home: /usr/share/maven
Java version: 21.0.2, vendor: BiSheng, runtime: /usr/lib/jvm/java-21-openjdk-21.0.2.12-2.oe2403.riscv64
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "6.6.0-27.0.0.31.oe2403.riscv64", arch: "riscv64", family: "unix"
```

### Run test (e.g mica-mqtt)
```
cd mica-mqtt
bash mica-mqtt-test.sh
```