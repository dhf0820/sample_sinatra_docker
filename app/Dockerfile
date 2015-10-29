FROM sinatra-base
MAINTAINER Donald French <dhfrench@vertisoft.com>

COPY scripts/*.sh /home/sinatra/bin/

#Manage the gem files
COPY "sinatra/Gemfile" "sinatra/Gemfile.lock" "/tmp/"
#COPY ["sinatra/Gemfile", "sinatra/Gemfile.lock", "/tmp/"]
WORKDIR /tmp
RUN ["/home/sinatra/bin/bundle-it.sh"]
WORKDIR /home/sinatra
# Now add the actual app
COPY sinatra/* /home/sinatra/

EXPOSE 5678
CMD ["/home/sinatra/bin/startup.sh"]




