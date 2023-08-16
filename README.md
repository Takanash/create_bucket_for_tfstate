# 概要
これはTerraformでtfstateをS3に保存する際に必要なリソースを自動で作成・削除するシェルスクリプトです。

# 前提
- aws-cli, jqがローカルで使用できること
- AWSでアカウントおよびアクセスキーを発行し、適切なポリシーが付与されていること

# 環境変数
### tfstate bucket用
```
touch main.tfbackend
```

```
bucket = ******           # バケット名
key    = "main.tfstate"   # tfstateのファイル名
```

### main.tf用
```
touch terraform.tfvars
```

```
access_key         = ******    # AWSのアクセスキー
aws_profile        = "default" # aws-cliのプロファイル
secret_key         = ******    # AWSのシークレットキー
region             = "ap-northeast-1" # AWS region

```

# tfstate bucketの作成
```
sh bin/create_bucket_for_tfstate.sh
```

# tfstate bucketの削除
```
sh bin/remove_bucket_for_tfstate.sh
```

# 参考
[TerraformのtfstateファイルをS3に配置する](https://open-groove.net/terraform/terraform-tfstate-backend-s3/)

