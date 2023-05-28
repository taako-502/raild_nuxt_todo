FROM ruby:3.2.2

ENV RUNTIME_PACKAGES="libxml2-dev make gcc libc6-dev nodejs tzdata libpq-dev git curl" \
    DEV_PACKAGES="build-essential libcurl4-openssl-dev" \
    HOME="/app" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR ${HOME}

ADD Gemfile ${HOME}/Gemfile
ADD Gemfile.lock ${HOME}/Gemfile.lock

RUN apt-get update -yqq && \
    apt-get upgrade -yqq && \
    apt-get install -yqq --no-install-recommends ${RUNTIME_PACKAGES} && \
    apt-get install -yqq --no-install-recommends ${DEV_PACKAGES} && \
    bundle install -j4 && \
    apt-get autoremove -yqq --purge ${DEV_PACKAGES} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD . ${HOME}

CMD ["rails", "server", "-b", "0.0.0.0"]
