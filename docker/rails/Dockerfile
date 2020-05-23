FROM ruby:2.5.1

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential \ 
    libpq-dev \        
    nodejs \          
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /bookcafe-review-app 

ENV APP_ROOT /bookcafe-review-app
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT