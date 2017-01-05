#!/bin/bash

APPNAME='exampleapp'
PGSQLUSERNAME='exampleapp'
PGSQLPASSWORD='exampleapppass'

# add repo for erlang
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update -y

# Install node
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs

# install erlang, elixir, postgres and inotify-tools
sudo apt-get install -y esl-erlang elixir postgresql postgresql-contrib inotify-tools
sudo ln -s /usr/bin/nodejs /usr/bin/node

# install phoenix
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# create project
mix phoenix.new /opt/apps/$APPNAME

# get all dependencies for phoenix
cd /opt/apps/$APPNAME
mix local.hex --force
mix local.rebar --force
mix deps.get --force

# install postgres user
sudo -u postgres bash -c "psql -c \"CREATE USER $PGSQLUSERNAME WITH PASSWORD '$PGSQLPASSWORD';\""
sudo -u postgres bash -c "psql -c \"ALTER USER $PGSQLUSERNAME WITH SUPERUSER;\""

# Replace connection info in dev environment
sed -i -e "s/username: \"postgres\"/username: \"$PGSQLUSERNAME\"/g" /opt/apps/$APPNAME/config/dev.exs
sed -i -e "s/password: \"postgres\"/password: \"$PGSQLPASSWORD\"/g" /opt/apps/$APPNAME/config/dev.exs

# Create database
mix ecto.create

# Upgrade npm
sudo npm install -g npm
npm install --no-bin-links