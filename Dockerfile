FROM ruby:3.4.1

WORKDIR /myapp
COPY . /myapp

# We usually run this every time we add a new dependency
RUN gem install bundler -v 2.5.19
RUN gem install jekyll -v 3.9.3
RUN bundle config build.nokogiri --use-system-libraries
RUN gem install nokogiri -v 1.14.2
RUN bundle install

EXPOSE 4000

CMD bundle exec jekyll s --host 0.0.0.0 --safe
