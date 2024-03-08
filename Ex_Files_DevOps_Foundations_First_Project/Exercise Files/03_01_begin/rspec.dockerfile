FROM ruby:alpine
MAINTAINER Johan Mikkelsen <johan.hm@hotmail.dk>

RUN apk add build-base ruby-nokogiri
RUN gem install rspec capybara selenium-webdriver

ENTRYPOINT [ "rspec" ]