## Rails
```
docker-compose build
```

以下のコマンドでDockerを立ち上げ。
```
docker-compose up
```

## Nuxt
以下のコマンドを実行。
```
docker-compose run --rm front npx create-nuxt-app --overwrite-dir
```

以下のように入力。
```
create-nuxt-app v3.7.1
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

実行
```
docker-compose up front
```

`http://localhost:8080`を開く。

## 参考
https://qiita.com/at-946/items/08de3c9d7611f62b1894
https://qiita.com/rearail/items/0141dd7c754c97f009e3
