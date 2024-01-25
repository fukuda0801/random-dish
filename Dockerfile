FROM ruby:3.0.2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get update && apt-get install -y curl apt-transport-https wget nodejs yarn && \
    apt-get clean

RUN mkdir /random_dish
WORKDIR /random_dish

COPY Gemfile /random_dish/Gemfile
COPY Gemfile.lock /random_dish/Gemfile.lock
RUN bundle install
RUN yarn install --check-files

COPY . /random_dish

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
