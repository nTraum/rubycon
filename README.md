# About

Rubycon is a CLI for managing Source dedicated game servers (TF2, CS:S...). Think of it as a [HSLW](http://www.hlsw.org) clone, but terminal-based.

![Screenshot](http://i.imgur.com/k8q3zXO.png)

Features:

* RCON session with auto completion :exclamation:
* Overview of all your servers
* Bulk execution of rcon commands :boom:
* Start game client and join servers from the command line

Follow this gem on [Twitter](https://twitter.com/rubycon_cli).

# Installation

Rubycon was written in Ruby, Version 1.9.2 is minimum to run rubycon. (`ruby -v`).
Make sure to have the following libraries installed:

* RHEL based:   `yum install readline-devel bzip2-devel`
* Debian based: `apt-get install libreadline-dev libbz2-dev`

Install rubycon with the following command:

`$ gem install rubycon`

# Usage

First of all, add a game server to rubycon:

```
$ rubycon add my_server \
    --address=192.168.0.1 \
    --rcon=foobar
```

Time to check out how your server is doing:

```
$ rubycon list
Server                   Map     Players      Ping
my_server          ctf_2fort        4/25        42
```

Hop into a rcon session:

```
$ rubycon console my_server
Use CTRL+D to exit.
> sta
star_memory  startdemos   startmovie   startupmenu  stats        status
> status
hostname: MyServer
version : 1797820/24 5331 secure
udp/ip  : 192.168.0.1:27015  (public ip: 192.168.0.1)
account : not logged in  (No account specified)
map     : ctf_2fort at: 0 x, 0 y, 0 z
sourcetv:  port 27020, delay 90.0s
players : 0 (25 max)

# userid name                uniqueid            connected ping loss state  adr
>
```

Need stats from all your servers? Yes sir:

```
$ rubycon execute --command=stats --all
my_server:
CPU    In (KB/s)  Out (KB/s)  Uptime  Map changes  FPS      Players  Connects
0.00   0.00       0.00        5093    7            62.44    0        1
---------------------------------
```

Need further help?
`$ rubycon help`
`$ rubycon help execute`
`$ rubycon help rm`
...

# Contributing

* Fork it
* Create your feature branch (`git checkout -b my-new-feature`)
* Commit your changes (`git commit -am 'Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request

# Code Status

* [![Gem Version](https://badge.fury.io/rb/rubycon.png)](http://badge.fury.io/rb/rubycon)
* [![Build Status](https://travis-ci.org/nTraum/rubycon.png?branch=master)](https://travis-ci.org/nTraum/rubycon)
* [![Dependency Status](https://gemnasium.com/nTraum/rubycon.png)](https://gemnasium.com/nTraum/rubycon)
* [![Code Climate](https://codeclimate.com/github/nTraum/rubycon.png)](https://codeclimate.com/github/nTraum/rubycon)

# License

rubycon is released under the [MIT](http://opensource.org/licenses/MIT) License.
