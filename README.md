# Rubycon

Rubycon is a CLI for managing Source dedicated game servers (TF2, CS:S...). Think of it as a [HSLW](http://www.hlsw.org) clone, but terminal-based.

# Installation

Rubycon was written in Ruby, make sure you have at least 1.9.3 installed (`ruby -v`).

`$ gem install rubycon`

# Usage

`$ rubycon add youralias --address=127.0.0.1 --rcon=foobar` adds a new game server. If you want to specify a non-default port (27015), add `--port 54321` to the command.

`$ rubycon list` lists all your game servers.

`$ rubycon console youralias` starts a rcon session to a server. It supports auto completion too!

`$ rubycon rm youralias` will remove a server from the list.