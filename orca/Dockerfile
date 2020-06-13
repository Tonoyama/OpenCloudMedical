FROM ubuntu:18.04

# ORCAの管理者である ORMASTERのパスワードをXXXXXXXに設定します
ENV ORMASTER_PASSWORD=srkn395%
ENV DEBIAN_FRONTEND=noninteractive

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get -yqq update && \
  apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl git man unzip vim wget syslinux-common sudo 
# データベース設定ファイルをコピーする
COPY db.conf /etc/jma-receipt/

RUN apt-get update \
  && apt-get install -my wget gnupg

RUN set -xe \
  && cd /tmp \
  && wget -q https://ftp.orca.med.or.jp/pub/ubuntu/archive.key \
  && apt-key add archive.key \
  && wget -q -O /etc/apt/sources.list.d/jma-receipt-bionic51.list https://ftp.orca.med.or.jp/pub/ubuntu/jma-receipt-bionic51.list

RUN set -xe \
  && apt-get update \
  && apt-get dist-upgrade \
  && apt-get install -y jma-receipt \
  && wget https://ftp.orca.med.or.jp/pub/data/receipt/outline/update/claim_update.tar.gz \
  && tar xvzf claim_update.tar.gz \
  && bash claim_update.sh \
  && service postgresql restart \
  && service postgresql start \
  && jma-setup \ 
  && service jma-receipt start \
  && service jma-receipt stop \
  && service jma-receipt start \
  && /bin/echo -e "$ORMASTER_PASSWORD\n$ORMASTER_PASSWORD" | sudo -u orca /usr/lib/jma-receipt/bin/passwd_store.sh \
  && apt-get install -y panda-client2

RUN rm -rf /tmp/* /var/lib/apt/lists/*
VOLUME ["/tmp"]

EXPOSE 8000 5432