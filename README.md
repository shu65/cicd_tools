# my_jenkins
## Setup
```bash
# edit jenkins/plugins.txt
mkdir -p jenkins_home
mkdir -p registry_data

docker-compose build
```

## Start jenkins 
```bash
docker-compose up -d
```

## Stop jenkins
```bash
docker-compose down
```
