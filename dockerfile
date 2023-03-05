FROM ruby:3.0.0-alpine
RUN apk add --no-cache build-base git nodejs npm tzdata sqlite-dev
RUN gem install bundler
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ["rails", "server", "-b", "0.0.0.0"]
