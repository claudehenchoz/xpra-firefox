# xpra-firefox

This runs Firefox in Xpra so you can attach to it from different systems.

Xpra allows you to use the speed of X-forwarding (a bit faster even) and the detach/attach possibilities of VNC.

## Usage

To run Firefox on 'fireserver' listening for xpra-connections on tcp/12345 for clients that want to use it:

* Run the container : `docker run -d -p 12345:10000 --name xprafire garo/xpra-firefox`

* Wait a couple of seconds for everything to start...

* You can now use xpra on a client to connect to it with: `xpra attach tcp:fireserver:12345`

* If you detach the xpra connection from the client firefox will continue to run.
* Closing Firefox will also stop the container. With `docker start xprafire` it will start again.

The environment variable `XPRA_PORT` is `10000` by default but can be changed to make xpra listen to another port.

## Development
Want to improve this (bugfixes, extra features, ...) ?

Fork this repository on GitHub instead of cloning it,
I and other users might be interested in your changes !