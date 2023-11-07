# Rails Nuxt Todo

Ruby on Rails　と Nuxt.js で Todoリストを開発してみました。

## 実行方法
### Ruby
```bash
$ docker-compose build
$ rm -f /app/tmp/pids/server.pid
$ docker-compose up back -d
```

### Nuxt
以下のコマンドを実行。
```bash
$ cd front
$ yarn dev
```

`http://localhost:3333`を開く。<br>


## 参考
- [Nuxt.js + Rails(API) on DockerのHello Worldするべ！](https://qiita.com/at-946/items/08de3c9d7611f62b1894)
- [Nuxt.js × Rails APIモードでアプリケーションを作る](https://qiita.com/rearail/items/0141dd7c754c97f009e3)
- [@nuxtjs/axios](https://www.npmjs.com/package/@nuxtjs/axios)
- [AtomのVue.js関係プラグインまとめ](https://qiita.com/mrmr/items/f6927eb2fe5aa13a2f90)
