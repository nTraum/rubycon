# Rubycon

Rubycon is a CLI for managing Source dedicated game servers (TF2, CS:S...). Think of it as a [HSLW](http://www.hlsw.org) clone, but terminal-based.

# Installation

Rubycon was written in Ruby, Version 1.9.3 is minimum to run rubycon. (`ruby -v`).
Make sure to have the following libraries installed:

* RHEL based:   `yum install readline-devel bzip2-devel`
* Debian based: `apt-get install libreadline-dev libbz2-dev`

Install rubycon with the following command:

`$ gem install rubycon`

# Usage

`$ rubycon add youralias --address=127.0.0.1 --rcon=foobar` adds a new game server. If you want to specify a non-default port (27015), add `--port 54321` to the command.

`$ rubycon list` lists all your game servers.

`$ rubycon console youralias` starts a rcon session to a server. It supports auto completion too!

`$ rubycon rm youralias` will remove a server from the list.