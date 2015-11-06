#
# cruder-base-project Dockerfile
#
# https://bitbucket.org/carbonoio/cruder-base-project
#

# Pull base image.
FROM mongo

# Install everything
RUN \
  apt-get update                                         && \
  apt-get install -y curl                                && \
  curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
  apt-get install -y nodejs                              && \
  apt-get install -y supervisor                          && \
  apt-get remove -y curl                                 && \
  apt-get autoremove -y                                  && \
  apt-get clean                                          && \
  npm install -g mongodb-rest

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 3000

# Define working directory.
WORKDIR /data

# Define default command.
ENTRYPOINT ["/usr/bin/supervisord"]
