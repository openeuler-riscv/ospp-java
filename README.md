## 项目简介
本项目旨在验证ospp的Java项目在RISC-V平台上的运行情况。
ospp项目梳理：https://docs.qq.com/sheet/DUUFmVGhia01FaWZn?tab=fxwl20

## 测试用例编写指南
### 编写原则
- 主旨为验证相关项目能够在RISC-V平台上使用（构建/运行）
- 尽量设计的可以完成 CI 自动化，保底也可以是手动
- 使用settings.xml配置国内阿里云的maven镜像，构建时使用方法：`-s <path-to>/settings.xml`

### 通用的测试用例格式（可参考mica-mqtt目录）
- 项目名作为单独的目录
- 使用 `项目名-test.sh` 作为测试用例脚本名称
- 需要在最后的Test result部分填写Success Flag

### 判断测试用例编写方法
- 下述几种情况，可以根据每个项目的情况自行判断哪种方式更为合适，选择一种即可

#### 官方文档包含测试用例或快速开始指南的情况
以 `mica-mqtt/mica-mqtt-test.sh` 为例，参考官方[快速开始](https://gitee.com/dromara/mica-mqtt/blob/master/example/README.md#%E5%BF%AB%E9%80%9F%E5%BC%80%E5%A7%8B) ，可以以客户端连接成功，并打印类似如下日志为成功的标识：
```
2021-07-05 20:46:13,932 INFO  client.MqttClientTest - /test/123	mica最牛皮
```

#### 官方源码包含测试用例的情况
以 `mica/mica-test.sh` 为例，项目本身为maven构建的项目并且包含测试用例，只需要按照maven项目的构建测试步骤执行即可：
```
mvn clean test
```
构建完成后的 `BUILD SUCCESS` 即为测试成功的标识。
PS: 当maven项目出现非架构引起（即在x86上也会出现）的测试问题时，可以使用如下命令跳过测试直接执行构建，此时如果可以构建成功也视同测试成功。
```
mvn clean package -DskipTests
```

#### 其他需要特殊处理的情况
此类项目通常非maven项目同时测试步骤比较繁琐，或特殊配置项/依赖项较多，此时处理方法有（任选其一）：
- 根据文档构建出产物即可
- 编写手动执行文档，格式为Markdown

例如[MaxKey](https://gitee.com/dromara/MaxKey)可以根据[官方文档](https://www.maxkey.top/doc/docs/install/deploy_linux)进行复现，并重新整理步骤。

## 测试运行指南
### 测试环境
- openEuler 24.03 (LTS) for RISC-V
- 在拥有sudo权限的非root用户下运行
- 建议事先配置好华为云的[maven镜像](https://mirrors.huaweicloud.com/mirrorDetail/5ea0025f2ab89b484a4dd5ce?mirrorName=maven&catalog=language)

### 安装依赖（默认使用JDK21，项目有特殊要求的单独处理）
```
sudo dnf install java-21-openjdk-devel 
sudo dnf install maven
```

### 设置默认JDK路径
```
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
```

### 检查测试环境
```
$ mvn -version                                
Apache Maven 3.6.3 (openEuler 3.6.3-2)
Maven home: /usr/share/maven
Java version: 21.0.2, vendor: BiSheng, runtime: /usr/lib/jvm/java-21-openjdk-21.0.2.12-2.oe2403.riscv64
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "6.6.0-27.0.0.31.oe2403.riscv64", arch: "riscv64", family: "unix"
```

### 运行测试 (以mica-mqtt为例)
```
cd mica-mqtt
bash mica-mqtt-test.sh
```