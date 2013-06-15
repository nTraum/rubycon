# Rubycon

Rubycon is a CLI for managing Source dedicated game servers (TF2, CS:S...). Think of it as a [HSLW](http://www.hlsw.org) clone, but terminal-based.

# Installation

`$ gem install rubycon`

# Usage

Rubycon offers help on the terminal.
`$ rubycon help`
`$ rubycon add help`
`$ rubycon console help` etc...

## Adding

Start off by telling your rubycon about your game server.

```
$ rubycon add ETF2L_DE_1 --address=212.83.57.144 --rcon=foobar
```

## Listing

You can get a nice overview of all your servers by using the `list` command.

```
$ rubycon list

┏━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━┓
┃ Alias       ┃ Name                      ┃                Map ┃  Players ┃ Ping ┃
┣━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━╊━━━━━━━━━━╊━━━━━━┫
┃ ETF2L_DE_1  ┃ ETF2L.org Server DE #1 b  ┃  cp_gullywash_fina ┃     0/20 ┃  127 ┃
┗━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━┛

```

## Starting a RCON session

Hop into a rcon session with the `console` command. It offers auto completion too!

```
$ rubycon console ETF2L_DE_1
Use CTRL+D to exit.
> status
hostname: ETF2L.org Server DE #1 by Hypernia.com
version : 1797820/24 5331 secure
udp/ip  : 212.83.57.144:27015  (public ip: 212.83.57.144)
account : not logged in  (No account specified)
map     : cp_gullywash_final1 at: 0 x, 0 y, 0 z
sourcetv:  port 27020, delay 90.0s
players : 1 (21 max)

# userid name                uniqueid            connected ping loss state  adr
#      2 "SourceTV"          BOT                                     active
>
```

## Deleting

Deletes servers from your list.

```
$ rubycon rm ETF2L_DE_1
```