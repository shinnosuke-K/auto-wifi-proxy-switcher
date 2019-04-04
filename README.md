# auto-wifi-proxy-switcher

僕の同期が作ってくれたmacのネットワーク環境を自動で切り替えるツールを大学のプロキシやgitに対応させたものです．

SSID一覧を監視し、変更があった場合にjobを実行します.
ここではKE-101-1というwifiが存在した場合nislabと名前のついたネットワーク環境に自動で切り替えます.

## Requirement

 * nislabと名前のついたネットワーク環境をあらかじめ作成しておく必要があります.

   (作成方法は先輩に聞いてね)
 * SSIDがKE-101-1である前提で作られています.

![2018-04-14 13 19 59](https://user-images.githubusercontent.com/12538942/38764428-c00d2eaa-3fe9-11e8-8227-c5644b92eb2b.png)

### プロキシの設定

ターミナルから git を使う場合，プロキシを通る必要があるので

（アドレスなどがわからなかったらこれも先輩に聞いて）

```
HTTP_PROXY_NAME
HTTPS_PROXY_NAME
```

という変数を用意しているので設定してください

### ネットワーク環境の名前または、SSIDを別のものにしたい場合

環境変数を変更することで変更できます.

研究室の場合は

```
LAB_NETWORK
LAB_SSID
```

という環境変数になっていますので、これに設定

個人的に作成した場合は
```
PRI_NETWORK
PRI_SSID
```

に設定してください．

それと、gitにプロキシを反映させているのは

```sh
git config --global http.proxy $HTTP_PROXY_NAME
git config --global https.proxy $HTTPS_PROXY_NAME
git config --global url."https://".insteadOf git://
```

これで、プロキシの解除は

```sh
git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset url."https://".insteadOf
```

でやってます．（いらないなら消して）


## 使いかた

```sh
make install
```
で終わりです

## アンインストールする

```sh
make uninstall
```

# 最後に
僕の同期が作ってくれたものを，ベースになっているので同期に感謝ですね

あと，ある状況下では動作しない可能性があるのであしからず


動かないなどがあれば教えてください