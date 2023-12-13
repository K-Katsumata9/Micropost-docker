FROM ruby:3.2.2
RUN apt-get update -qq && \
apt-get install --no-cache -y gcc-c++ \
glibc-headers \
openssl-devel \
readline \
libyaml-devel \
readline-devel \
zlib \
zlib-devel \
libffi-devel \
libxml2 \
libxslt \
libxml2-devel \
libxslt-devel \
mariadb-client \
bash \
curl \
bats \
jq

# Create app user
RUN addgroup -g 1000 app && \
    adduser -u 1000 -G app -D app
		
# Create public volume
RUN mkdir /public
RUN chown app:app /public
VOLUME /public

# Set working directory and application user
WORKDIR /app
USER app

COPY Micropost-sample-app/Gemfile* /app
RUN bundle install