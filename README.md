# cftcl

Get lots of packages for little effort and size!

~~~
snapcraft build
sudo snapcraft install ./cftcl-8.7+2_amd64.snap --dangerous --classic
~~~

--dangerous is needed because the package you just built isn't signed, and --classic is needed because it's an interpreter that can do anything the language allows.

## Supported Architectures
Currently supported architectures are:
- amd64
- arm64
- armhf

The snap can't cross-compile though, so to build for arm you have to build on an arm system.  That requires the --use-lxd option to snapcraft
and the associated lxd setup (multipass snap building doesn't work on arm yet).  Expect and tcc4tcl are currently excluded from arm64 because their
build systems don't understand that architecture yet.

The packages will build from source with CFLAGS="-march=native -O3", so they're only guaranteed to run on the same CPU that the build was run on,
but they'll be as fast as they can for that hardware.  Change that to just "-O2" for a more generally compatible build.
