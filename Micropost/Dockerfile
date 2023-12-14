FROM ruby:3.2.2
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    libmariadb-dev \ 
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Create app user
RUN groupadd -g 1000 app && useradd -u 1000 app -g app
		
# Create public volume
RUN mkdir /public
RUN chown app:app /public
VOLUME /public

# Set working directory and application user
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY --chown=app:app . /app

