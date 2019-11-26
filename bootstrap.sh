#!/bin/bash

# add repo for erlang
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update -y

# install erlang, elixir, postgres and inotify-tools
sudo apt-get install -y esl-erlang elixir inotify-tools

