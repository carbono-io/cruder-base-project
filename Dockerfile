#
# cruder-base-project Dockerfile
#
# https://bitbucket.org/carbonoio/cruder-base-project
#

# Pull base image.
FROM mongo

# Install everything
RUN \
  cd /tmp                                        && \
  apt-get update                                 && \
  apt-get install -y wget                        && \
  apt-get install -y python                      && \
  apt-get install -y gcc                         && \
  apt-get install -y g++                         && \
  apt-get install -y make                        && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz                    && \
  rm -f node-latest.tar.gz                       && \
  cd node-v*                                     && \
  ./configure                                    && \
  make                                           && \
  make install                                   && \
  cd /tmp                                        && \
  rm -rf /tmp/node-v*                            && \
  apt-get remove -y wget                         && \
  apt-get remove -y python                       && \
  apt-get remove -y g++                          && \
  apt-get remove -y gcc                          && \
  apt-get remove -y make                         && \
  apt-get autoremove -y                          && \
  apt-get clean                                  && \
  npm install amid -g

EXPOSE 3000

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["amid"]
