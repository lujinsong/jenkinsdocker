# Building Docker Image with Jenkins

## Create Express nodejs project
``` 
    #install express-generator. https://code.visualstudio.com/tutorials/nodejs-deployment/express
    npm install -g express-generator
    cd ~
    mkdir jenkinsdocker
    cd ~/jenkinsdocker
    # tell express-generator to use pug template engine(know as jade before) and create a .gitignor file.
    express -view pug --git    
``` 
## Create a github repository
    
``` 
   # create a git repository under your github account, then run the command below
    cd ~/jenkinsdocker
    git init
    git add -A
    git commit -m "first commit"
    git remote add origin https://github.com/[your git hub account]/jenkinsdocker.git
    git push -u origin master
``` 
## Set up Dockerfile, which will be used to create docker image.
Dockerfile
```
# use a node base image
FROM node:7-onbuild
# set maintainer
LABEL maintainer "lu_jasper@yahoo.com"
# set health check
HEALTHCHECK --interval=5s\
       --timeout=5s\
       CMD curl -f http://127.0.0.1:3000|| exit 1
# tell docker which port to expose
EXPOSE 3000 
```
Since it use the official node base image onbuild, it inherits the following actions.
1. Copy all the files in the current directory to /usr/src/app folder inside the container image
2. Run npm install to install any dependencies for the app
3. Specify npm start as the command when the container starts, similar to the Docker Command "Run npm start" 
## Create pipeline configuration inside the Jenkinsfile, so it becomes part of the application code
Jenkinsfile
```

```

