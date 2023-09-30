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

以下を記載

```
bucket  = "my-bucket"      # tfstate保存用バケットの名前
key     = "main.tfstate"   # 任意のtfstateのファイル名
region  = "ap-northeast-1" # AWS region
profile = "my-profile"     # 任意のaws-cliのプロファイル
```

### main.tf用
```
touch terraform.tfvars
```

以下を記載

```
access_key         = ******       # AWSのアクセスキー
secret_key         = ******       # AWSのシークレットキー
aws_profile        = "my-profile" # aws-cliのプロファイル
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

# terraform init
```
terraform init -backend-config="main.tfbackend"
```

# 参考
[TerraformのtfstateファイルをS3に配置する](https://open-groove.net/terraform/terraform-tfstate-backend-s3/)
