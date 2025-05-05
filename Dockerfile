
FROM rockylinux:8

# 必要パッケージのインストール
RUN dnf update -y && \
    dnf install -y \
    gcc \
    git \
    python38 \
    python38-devel \
    python38-pip \
    libffi-devel \
    openssl-devel \
    && dnf clean all

# pip をアップグレード
RUN python3.8 -m pip install --upgrade pip

# ansible用パッケージをオフラインインストール用に保存
RUN mkdir /root/ansible-packages && \
    cd /root/ansible-packages && \
    python3.8 -m pip download ansible==2.9.27 ansible-lint==5.4.0

# ansible 2.9.27 と ansible-lint 5.4.0 をインストール
RUN python3.8 -m pip install ansible==2.9.27 ansible-lint==5.4.0

# ansible と ansible-lint のパスを /usr/bin にリンク（存在すれば）
RUN if [ -f /usr/local/bin/ansible ]; then ln -sf /usr/local/bin/ansible /usr/bin/ansible; fi && \
    if [ -f /usr/local/bin/ansible-lint ]; then ln -sf /usr/local/bin/ansible-lint /usr/bin/ansible-lint; fi

WORKDIR /root

CMD ["/bin/bash"]
