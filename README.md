dbt-playground
======================
description: https://keyhong.github.io/2024/02/21/Toy/side-project/

| Pipeline Component                     | Version | Description              |
|----------------------------------------|---------|--------------------------|
| [MySQL](https://www.mysql.com/)        | 8.36+   | Relational Database      |
| [Hadoop](https://trino.io/)            | 3.3.6+  | Distributed Storage      |
| [Trino](https://trino.io/)             | 438+    | Query Engine             |
| [Hive](https://trino.io/)              | 3.1.3   | Query Solution           |
| [DBT](https://www.getdbt.com/)         | 1.7.1   | Analytics Framework      |
| [Kudu](https://kudu.apache.org/)       | 2.3+    | Columnar Distributed Database |

# Execution

- 프로그램은 아파치 미러 서버(CDN)에서 다운받도록 되어있습니다.

- trino의 username은 어느 것이든 상관없으나 처음 사용하는 유저네임을 계속 사용해야합니다.

- dbt-trino 내 profiles 내의 user과 맞춰주셔야 합니다. 패스워드는 없습니다.

- dbt는 파이썬 가상환경(virtualenv)을 만들어야 합니다. profiles.yml이 패키지 내에 있어 따로 설정하시지 않아도 됩니다.

- kudu와 datanode의 replica는 1으로 설정 되어 있습니다.

- hue나 hivesever2가 필요하시면 docker-compose.yml에서 주석을 풀어 사용가능합니다.

## Getting Started

```bash
$ make build

$ make up
```

1. `./mnt/schematool-check` 폴더 안에 inital 파일이 생기면 metastore가 정상 실행 되었되었습니다.

2. 이 후 jdbc:trino://localhost:8080로 붙여주시면 사용가능합니다.
   
## Delete All

만약 에러가 나면, `./mnt` 폴더 안의 `./mnt/hadoop/*`, `./mnt/mysql/*`, `./mnt/schematool-check/*` 를 지워주세요.

```bash
$ make delete-all
```
