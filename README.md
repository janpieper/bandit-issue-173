# Gangster

This application is used to demonstrate an issue discussed in [bandit#173](https://github.com/mtrudel/bandit/issues/173).

## Setup

Get dependencies and compile the application:

```console
mix deps.get
mix deps.compile
mix compile
```

Start the application:

```console
iex -S mix
```

## Usage

Use [websocat](https://github.com/vi/websocat) to connect to the websocket:

```console
websocat ws://127.0.0.1:6789/ws
```

Messages that can be parsed as JSON should be answered with "ok":

```console
$ websocat ws://127.0.0.1:6789/ws
{"name":"jan"}
ok
```

Messages that can **NOT** be parsed as JSON will not be answered:

```console
$ websocat ws://127.0.0.1:6789/ws
hello world
```

## Problem

Open the websocket connection like described above and try sending multiple messages that cannot be parsed as JSON:

```console
$ websocat ws://127.0.0.1:6789/ws
hello world
this is
not json
```

You'll see these messages in the IEx:

```
[info] Starting websocket
[warning] Incoming message "hello world\n" could NOT be parsed as JSON
[error] Terminating websocket: :normal
[warning] Incoming message "this is\n" could NOT be parsed as JSON
[warning] Incoming message "not json\n" could NOT be parsed as JSON
```

Even after the websocket connection should have been terminated, we can still send messages to the server that will still be handled.
