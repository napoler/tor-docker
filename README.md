# Tor Proxy

This is a simple and lightweight Docker image for running a Tor proxy.

The base image used is `alpine`.
# bulid

```
docker build -t napoler/tor_proxy ./
```
# Usage

It is pretty simple to run and has some sane defaults.

```
$ docker run \
    --rm \
    --detach \
    --name tor \
    --publish 9050:9050 \ # change the port to whatever you put in the torrc
    palnabarun/tor
...
```

The Tor proxy would be coming up shortly after establishing a Tor circuit.

If you want to customize the Tor configuration, create a `torrc` locally and the mount the same as a volume.

ControlPort 0.0.0.0:9051
password 79623222

```
$ docker run \
    --name tor \
    --volume $PWD/torrc.default:/etc/tor/torrc.default \
    --publish 9050:9050 \
    --publish 9051:9051 \
    napoler/tor_proxy
...
```

The options in `torrc` are documented [here](https://2019.www.torproject.org/docs/tor-manual.html.en)


test

```
curl https://check.torproject.org/api/ip
curl --socks5 127.0.0.1:9050 https://check.torproject.org/api/ip
```

# Contributing

Please feel free to create issues and file PRs with any change that you wish to see.

# License

The repository is licensed under [GPLv3](https://choosealicense.com/licenses/gpl-3.0).
