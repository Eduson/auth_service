ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-stretch

ARG PG_MAJOR
ARG NODE_MAJOR
ARG BUNDLER_VERSION
ARG RAILS_ENV
ARG RAILS_MASTER_KEY

LABEL maintainer="Eduson Team <team@eduson.tv>"

ENV LANG=C.UTF-8 \
    LC_ALL=$LANG \
    LANGUAGE=$LANG \
    APP_HOME=/app \
    SHELL=/bin/bash \
    APPUSER=deployer \
    GEM_HOME=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 

ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

# Add PostgreSQL to sources list
RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list
# Add NodeJS to sources list
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# Add Yarn to the sources list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

WORKDIR $APP_HOME

RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential postgresql-client-$PG_MAJOR nodejs yarn=$YARN_VERSION-1 jq net-tools netcat mc nano sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log && \
    echo "$APPUSER ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN groupadd docker && useradd -m $APPUSER -s /bin/bash && \
    usermod -a -G root $APPUSER && \
    usermod -a -G sudo $APPUSER && \
    usermod -a -G docker $APPUSER && \
    mkdir -p $APP_HOME && mkdir -p $GEM_HOME && \
    gem update --system && \
    gem install bundler foreman rake --no-document && \
    chown -R $APPUSER.$APPUSER $APP_HOME && chown -R $APPUSER.$APPUSER $GEM_HOME && \
    cd /home/$APPUSER && git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1 && \
    #echo "GIT_PROMPT_ONLY_IN_REPO=1" >>/home/$APPUSER/.bashrc && \
    echo "source ~/.bash-git-prompt/gitprompt.sh" >>/home/$APPUSER/.bashrc

USER deployer

COPY --chown=deployer:deployer Gemfile* $APP_HOME/
RUN  bundle install -j $(nproc)
COPY --chown=deployer:deployer . $APP_HOME/
#&& bundle exec rails assets:precompile
#CMD ["bin/run", "app"]
#CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
#CMD ["bundle", "exec", "foreman", "start"]
