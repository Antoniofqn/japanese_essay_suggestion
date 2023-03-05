FROM ruby:3.0.0-alpine
RUN apk add --no-cache build-base git nodejs npm tzdata sqlite-dev
RUN gem install bundler
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN rails db:create db:migrate
RUN rake themes
RUN rake import_grammatical_constructions
EXPOSE 3000
#
CMD ["rails", "server", "-b", "0.0.0.0"]
