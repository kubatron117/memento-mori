# Použijeme oficiální obraz Ruby on Rails s Node.js
FROM ruby:3.3.6-bookworm

# Instalace závislostí pro Rails
RUN apt-get update -qq && apt-get install mariadb-client libmariadb-dev  -y

# Nastavení pracovního adresáře v kontejneru
WORKDIR /app

# Instalace gemu bundler
RUN gem install bundler

# Kopírování Gemfile a Gemfile.lock pro nainstalování závislostí
COPY Gemfile Gemfile.lock ./

#RUN bundle update

# Instalace gemů
RUN bundle install

# Kopírování zdrojových souborů do kontejneru
COPY . .

# Spuštění serveru
CMD ["rails", "server", "-b", "0.0.0.0"]
