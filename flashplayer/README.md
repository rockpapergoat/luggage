README
------

This downloads the Flash Player installer version specified as `PACKAGE_VERSION`, copies the actual pkg installer from the dumb app bundle, will copy a settings file to all existing users' homedirs (if needed), and installs the plugin pkg from /tmp via postflight. I know that's lame, but it works. The make also cleans up after itself.

Oh, proxy support works, too. Just define `PROXY` if you have one.