# Vails
一个简单的rails脚手架生成vue模板.
### 创建项目
```

rails new blog --api -T
```
### 添加gem Gemfile
```
……
gem 'webpacker'
gem 'vails'
……
```
### 安装gem
```
bundle
```
```
## 安装前端环境
rails webpacker:install
rails webpacker:install:vue
## 安装一些vue要用的库 必须
yarn add axios vuex vue-router
## 初始vails
rails g vue:install
## 最后
rails g vails Post title content:text
```

你就可以愉快的在rails上把玩vue啦
