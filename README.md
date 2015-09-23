CentOS7環境構築
====




## Requirement

実行環境に必要な環境は以下。

- Vagrant ~> 1.7.4
- Virtualbox >= 5
- vagrant-vbguest plugin  
```
vagrant plugin install vagrant-vbguest
```
- vagrant-berkshelf plugin  
```
vagrant plugin install vagrant-berkshelf
```
  - ChefDK >= 0.7.0

## Usage

### 起動

```
vagrant up
```

### 停止

```
vagrant halt
```

### 削除

```
vagrant destroy
```
