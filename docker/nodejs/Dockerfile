FROM ubuntu:trusty

# Don't know too much about this line...
RUN DEBIAN_FRONTEND=noneinteractive && \ 
    apt-get update -y --force-yes && \
    apt-get install -y --force-yes wget && \
    cd /usr/local/bin && \
    wget https://nodejs.org/dist/v5.3.0/node-v5.3.0-linux-x64.tar.gz && \
    tar xvf node-v5.3.0-linux-x64.tar.gz && \
    ln -s node-v5.3.0-linux-x64/bin/node && \
    ln -s node-v5.3.0-linux-x64/bin/npm && \
    mkdir /app && cd /app

EXPOSE 80
CMD cd /app && npm start
