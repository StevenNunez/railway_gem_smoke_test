FROM ruby:2.5
RUN gem update bundler rake
COPY . /app
WORKDIR /app
RUN bundle install
