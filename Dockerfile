# 拉取基础镜像
FROM ubuntu

# 基于当前用户权限
USER root

# 更新源，安装git
RUN apt-get update \
    && apt-get install -y git

# 安装命令行工具
RUN apt-get install -y bash curl file unzip xz-utils zip \
    && apt-get install -y libgl1-mesa-dev

# 安装Flutter SDK
ENV PUB_HOSTED_URL https://pub.flutter-io.cn
ENV FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
RUN cd /usr/bin \
    && git clone https://github.com/flutter/flutter.git

# 添加环境变量
ENV PATH /usr/bin/flutter/bin:$PATH

RUN flutter doctor
