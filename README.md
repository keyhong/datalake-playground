Toss-Assignement-Env
======================

# Execution

올라가는 데 시간이 좀 걸립니다! 프로그램은 아파치 미러 서버(CDN)에서 다운받도록 되어있습니다.
만약 `./mnt/schematool-check` 폴더 안에 inital 파일이 생기면 metastore가 정상 실행 되었기 떄문에 그 때
jdbc:trino://localhost:8080로 붙여주시면 사용가능합니다.

username은 어느 것이든 상관없으나 처음 사용하는 유저네임을 계속 사용해야합니다.
또한 dbt-trino 내 profiles 내의 user과 맞춰주셔야 합니다. 패스워드는 테스트용이라 없습니다.

혹시나 hue나 hivesever2가 필요하시면 docker-compose.yml에서 주석을 풀어주세요.
추가적으로 kudu와 datanode는 replica를 1으로 설정했습니다.

dbt는 파이썬 가상환경(virtualenv)을 만들어야 합니다. profiles.yml이 패키지 내에 있어 따로 설정하시지 않아도 됩니다.

```bash
$ make build

$ make up
```
# Delete All

만약 에러가 나면, `./mnt` 폴더 안의 `./mnt/hadoop/*`, `./mnt/mysql/*`, `./mnt/schematool-check/*` 를 지워주세요.

```bash
$ make delete-all
```


