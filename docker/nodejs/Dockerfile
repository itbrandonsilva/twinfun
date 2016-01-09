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

COPY ./prepend /usr/local/bin
RUN chmod +x /usr/local/bin/prepend

EXPOSE 80
#CMD cd /app && npm start
CMD cd /app && bash -c "npm start 2> >(prepend [ERR] >> APP_LOG) 1> >(prepend [OUT] >> APP_LOG)"

# Example start
# sudo docker run -v $PWD/my-app:/app --restart=on-failure:5 -p 3000:80 -d nodejs

# Start interactively
# sudo docker run -v $PWD/my-app:/app -p 80:80 -it nodejs /bin/bash
