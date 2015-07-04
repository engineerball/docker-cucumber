# docker-cucumber
Docker with ruby, go lang, cucumber

docker image running with ubuntu latest and ruby rvm 2.2, go lang, and cucumber for purpose to test BDD with cucumber

### Usage

``` 
git clone https://github.com/engineerball/docker-cucumber
cd docker-cucumber
docker build --rm=false -t engineerball/cucumber .
````

### Run
``` 
docker run -i -t engineerball/cucumber /bin/bash
```

