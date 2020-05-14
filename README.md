# Nuxt.js Rails JWT

* Frontend: Nuxt.js
* Backend: Rails(API Mode)

## 開発環境構築

### ツール
* Docker, docker-compose, nodejs, yarn

### アプリケーションの構築

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

yarn install
yarn dev
```

http://localhost:3000 にアクセスする

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

