# Nuxt.js Rails JWT

* Frontend: Nuxt.js
  * JS
  * axios
  * auth module(local)
  * Tailwind CSS
* Backend: Rails
  * API Mode
  * JWT
  * CORS


## 開発環境構築

### ツール
* Docker, docker-compose, nodejs, yarn

macOS環境を想定。あらかじめ上記のツールをインストールしておく。

### アプリケーションの構築
Rails, Nuxtをそれぞれ別のターミナルで起動する

#### Rails
```
cd rails

# 初回
make build

# railsを起動
make serve
```

#### Nuxt.js
```
cd nuxt

# 初回
cp .env.sample .env
yarn install

# nuxt を起動
yarn dev
```

http://localhost:3000 にアクセスする

## API Docs

https://documenter.getpostman.com/view/193491/SzmiWwB6

## 技術スタック
* Docker
* docker-compose
* rails
  * ruby:2.7.1
  * Rails 6.0.3
  * postgresql:10
  * redis:4
  * jwt
* nuxt.js
  * node:10
  * yarn
  * nuxt.js ^2.0.0
  * auth module
  * Tailwind CSS


## Screenshot
![](https://user-images.githubusercontent.com/1701108/81878534-4e1e6e80-95c3-11ea-83fa-d33f5c299e1d.png)
