
# rocky8-ansible

Rocky Linux 8 コンテナに Python 3.8、Ansible 2.9.27、ansible-lint 5.4.0 をインストールした環境です。  
Docker Compose と Dockerfile を使用して簡単にセットアップできます。

## 📌 コンテンツ

- ベースイメージ: rockylinux:8
- Python: 3.8
- Git: 最新版（Rocky Linux 8 リポジトリ提供）
- Ansible: 2.9.27（2.9 系の最新安定版）
- ansible-lint: 5.4.0

## 🐳 使用方法

### 1️⃣ ビルド

```bash
docker compose build --no-cache
```

### 2️⃣ コンテナ起動

```bash
docker compose up -d
```

### 3️⃣ コンテナに入る

```bash
docker exec -it rocky8-ansible /bin/bash
```

## 🔎 バージョン確認（コンテナ内）

```bash
python3.8 --version
git --version
ansible --version
ansible-lint --version
```

期待される出力:

```plaintext
Python 3.8.x
git version 2.x.x
ansible 2.9.27
ansible-lint 5.4.0
```

## 📥 オフラインインストール用パッケージの作成

コンテナ内で以下を実行し、ansible と ansible-lint の依存パッケージをダウンロードします。

```bash
mkdir /root/ansible-packages
cd /root/ansible-packages
python3.8 -m pip download ansible==2.9.27 ansible-lint==5.4.0
```

ホストにコピー：

```bash
docker cp rocky8-ansible:/root/ansible-packages ./ansible-packages
```

**オフライン環境でのインストール**：

```bash
python3.8 -m pip install --no-index --find-links=./ansible-packages ansible==2.9.27 ansible-lint==5.4.0
```

## ✅ 注意

- ansible==2.9.27 と ansible-lint==5.4.0 は互換性があります。
- ansible 2.10 以降と ansible-lint 6.x 以降は互換性がありません（バージョン固定済み）。
- Rocky Linux 8 の公式リポジトリを使用しています。

## 📝 免責事項

この環境は学習・テスト・開発目的で構築されています。本番利用時はセキュリティポリシー等をご確認ください。
