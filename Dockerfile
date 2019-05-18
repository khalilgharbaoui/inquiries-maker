# Dockerfile
FROM ruby:2.5.1-alpine3.7

MAINTAINER Khalil Gharbaoui <kaygeee@gmail.com>
ENV RAILS_ENV=production
ARG RAILS_MASTER_KEY

# Install system dependencies and remove the cache to free up space afterwards
RUN apk --update add --virtual build-dependencies build-base ruby-dev postgresql-dev postgresql-client libc-dev linux-headers git nodejs yarn tzdata bash && rm -rf /var/cache/lists/*_*

# Add the Gemfile and Gemfile.lock from our app
ADD Gemfile /app/
ADD Gemfile.lock /app/
# Add the rest of the app
ADD . /app

# Install bundler and run bundle install to install the gems from
# the Gemfile
RUN gem update --system --quiet --silent
RUN gem install bundler -v "~>2.0.1" --no-document
RUN cd /app \
  && bundle install --jobs 16 --without=development,test development test

# check if master key environment variable is present
RUN [ -z ${RAILS_MASTER_KEY} ] && echo 'MASTER KEY NOT PRESENT' && exit 1 || echo 'MASTER KEY PRESENT'
# Precompile assets
RUN cd app ; bundle exec rails assets:precompile

# change the owner to nobody instead of the default: root
# RUN chown -R nobody:nogroup /app
# Switch to the nobody user from here on down
# USER nobody

# Set environment variables and their default values
# These can be overridden when we run the container
ENV LANG C.UTF-8
ENV PORT=8000
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_SERVE_STATIC_FILES=true

# Set the working directory for the commands that we run inside containers
# from this image
WORKDIR /app

# Set the default command to run, if we don't provide a command when we run
# a container from this Images
CMD ["puma","-e","production"]
