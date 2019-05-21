FROM ruby:2.5.5-alpine3.9
MAINTAINER Khalil Gharbaoui <kaygeee@gmail.com>
# Set environment variables and their default values
# These can be overridden when we run the container
ENV RAILS_ENV=production
ENV BUNDLER_VERSION 2.0.1
ENV LANG C.UTF-8
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_SERVE_STATIC_FILES=true
ENV PORT=8000
ARG RAILS_MASTER_KEY

# Install system dependencies and remove the cache to free up space afterwards
RUN apk --update add --virtual build-dependencies build-base ruby-dev postgresql-dev postgresql-client libc-dev linux-headers git nodejs yarn tzdata bash && rm -rf /var/cache/lists/*_*

# Install dependencies for wkhtmltopdf
RUN apk add --update --no-cache --wait 10 \
  libstdc++ \
  libx11 \
  libxrender \
  libxext \
  libssl1.1 \
  ca-certificates \
  fontconfig \
  freetype \
  ttf-dejavu \
  ttf-droid \
  ttf-freefont \
  ttf-liberation \
  ttf-ubuntu-font-family \
&& apk add --update --no-cache --virtual .build-deps \
  msttcorefonts-installer \
\
# Install microsoft fonts
&& update-ms-fonts \
&& fc-cache -f \
\
# Clean up when done
&& rm -rf /tmp/* \
&& apk del .build-deps \
&& rm -rf /var/cache/lists/*_*

# Add the Gemfile and Gemfile.lock from our app
ADD Gemfile /app/
ADD Gemfile.lock /app/
# Add the rest of the app
ADD . /app

# Install bundler and run bundle install to install the gems from the Gemfile
RUN gem update --system --quiet
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

# Set the working directory for the commands that we run inside containers
# from this image
WORKDIR /app
# Set the default command to run, if we don't provide a command when we run
# a container from this Images
CMD ["puma","-e","production"]
