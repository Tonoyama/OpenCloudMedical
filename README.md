# OpenCloudMedical

![image](https://user-images.githubusercontent.com/33394165/152839439-19168955-4f3b-4bef-bca0-938f87ac15ca.png)

オープンソースのクラウド医療情報システムです。

下記のシステムが動作します。
- 医療事務・会計ソフト「ORCA」(JMA OpenSource License version 1.0)

https://www.orca.med.or.jp/

- 電子カルテ「OpenDolphin」(GNU General Public License v2.0)

https://www.lscc.co.jp/product/opendolphin/

Dockerコンテナ上で動作し、クラウド上で運用しやすいようにしています。

```
git clone https://github.com/Tonoyama/OpenCloudMedical.git
cd OpenCloudMedical
docker-compose up -d
```

本プログラムのLicense：GNU General Public License v2.0

製作者は、本プログラム（変更部分があるものも含みます。また、複製物を含みます）の使用により生じたいかなる損害の賠償の責も負わず、
使用者は自らの責任と負担において使用するものとします。
