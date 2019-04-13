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