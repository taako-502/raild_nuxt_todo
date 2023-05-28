# Rails Nuxt Todo
## 実行方法
```bash
$ docker-compose up front -d
$ rm -f /app/tmp/pids/server.pid
$ docker-compose up back -d
```

## Rails
```bash
$ docker-compose build
```

以下のコマンドでDockerを立ち上げ。
```bash
$ docker-compose up
```

## Nuxt
以下のコマンドを実行。
```bash
$ docker-compose run --rm front npx create-nuxt-app --overwrite-dir
```

以下のように入力。
```bash
$ create-nuxt-app v3.7.1
✨  Generating Nuxt.js project in .
? Project name: sample_app
? Programming language: TypeScript
? Package manager: Npm
? UI framework: None
? Nuxt.js modules: (Press <space> to select, <a> to toggle all, <i> to invert selection)
? Linting tools:
? Testing framework: None
? Rendering mode: Universal (SSR / SSG)
? Deployment target: Server (Node.js hosting)
? Development tools: jsconfig.json (Recommended for VS Code if you're not using typescript)
? What is your GitHub username? taako-502
? Version control system: None
```

`http://localhost:8080`を開く。<br>

Hello World.<br>
http://localhost:8080/users/new

## 参考
- [Nuxt.js + Rails(API) on DockerのHello Worldするべ！](https://qiita.com/at-946/items/08de3c9d7611f62b1894)
- [Nuxt.js × Rails APIモードでアプリケーションを作る](https://qiita.com/rearail/items/0141dd7c754c97f009e3)
- [@nuxtjs/axios](https://www.npmjs.com/package/@nuxtjs/axios)
- [AtomのVue.js関係プラグインまとめ](https://qiita.com/mrmr/items/f6927eb2fe5aa13a2f90)
