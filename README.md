## Phoenix framework server, Ubuntu 16.04, Vagrant under Windows

This is a project explaining how to easily setup a phoenix framework server running:
* Ubuntu - 16.04.1 LTS
* Nodejs - 7.x
* Postgreql - latest through apt-get
* Erlang - latest through apt-get
* Elixir - latest through apt-get
* Phoenix - latest through mix archive.install

As this is a bit of a walk to setup from scratch, i've created a bootstrap script to use with the ubuntu/trusty64 box.

Just change the variables in the bootstrap.sh file to setup the project directory and user/password for postgresql.

Run ```vagrant up```, login to server with ```vagrant ssh``` and run phoenix with ```mix phoenix.server```