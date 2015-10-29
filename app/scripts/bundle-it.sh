#!/bin/sh

# Load the required development systems to compile necessary gems
 apk -U add alpine-sdk openssl-dev ruby-dev openssl-dev
 apk -U add ruby ruby-bundler ruby-io-console bash postgresql-dev

#prevents the documents frm being installed. more savings 
 echo 'gem: --no-document' > ~/.gemrc 

# now bundle your gems. In this case we are using postgresql
 bundle config build.pg --with-pg-config=/usr/pgsql-9.4/bin/pg_config && \
 bundle install --clean --jobs=4 && \
 bundle install --binstubs --path vendor && \
 gem clean

 # Gems are installed now remove all development system to save lots of space
 apk -U --purge del alpine-sdk openssl-dev ruby-dev openssl-dev
 rm -vrf /var/cache/apk/*
 rm -v $0 #remove this script as it will not be needed again

