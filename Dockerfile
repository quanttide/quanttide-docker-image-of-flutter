# 拉取基础镜像
FROM ubuntu

# 设置为root用户
USER root

# 安装系统依赖
RUN apt-get update \
    && apt-get install -y git bash curl file unzip xz-utils zip libgl1-mesa-dev

# 安装Flutter SDK
RUN mkdir /sdk
WORKDIR /sdk
RUN git clone --progress --verbose https://github.com/flutter/flutter.git -b master

# 添加环境变量
ENV PATH /sdk/flutter/bin:$PATH
ENV PUB_HOSTED_URL https://pub.flutter-io.cn
ENV FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn

# Flutter 测试
RUN flutter doctor
