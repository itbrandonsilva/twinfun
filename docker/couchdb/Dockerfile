FROM ubuntu:trusty

# https://github.com/frodenas/docker-couchdb
# https://github.com/pixelpark/ppnet/wiki/Install-CouchDB-1.6.1-on-Ubuntu-14.04

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y && \
    apt-get install -y --force-yes \
    build-essential \
    curl \
    git \
    python-software-properties \
    python \
    g++ \
    make \
    erlang-dev \
    erlang-manpages \
    erlang-base-hipe \
    erlang-eunit \
    erlang-nox \
    erlang-xmerl \
    erlang-inets \
    libmozjs185-dev \
    libicu-dev \
    libcurl4-gnutls-dev \
    libtool \
    wget && \
    cd /tmp && \
    wget http://mirror.sdunix.com/apache/couchdb/source/1.6.1/apache-couchdb-1.6.1.tar.gz && \
    tar xzvf apache-couchdb-1.6.1.tar.gz && \
    cd apache-couchdb-1.6.1 && \
    ./configure && \
    make && \
    make install && \
    sed -e 's/^bind_address = .*$/bind_address = 0.0.0.0/' -i /usr/local/etc/couchdb/default.ini && \
    sed -e 's/^database_dir = .*$/database_dir = \/data/' -i /usr/local/etc/couchdb/default.ini && \
    sed -e 's/^view_index_dir = .*$/view_index_dir = \/data/' -i /usr/local/etc/couchdb/default.ini && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD local.ini /usr/local/etc/couchdb/local.ini

CMD ["/usr/local/bin/couchdb"]

# Expose listen port
EXPOSE 5984

# Expose our data, logs and configuration volumes
VOLUME ["/data", "/usr/local/var/log/couchdb", "/usr/local/etc/couchdb"]
