    FROM ruby:2.6.3
    RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
    RUN gem install rails -v 5.2.4
    COPY . /app
    WORKDIR /app
    ENTRYPOINT ["rails", "s", "p", "5000"]
