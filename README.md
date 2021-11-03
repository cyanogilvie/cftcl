# cftcl

Get lots of packages for little effort and size!

~~~
snapcraft build
sudo snapcraft install ./cftcl-8.7+11_amd64.snap --dangerous --classic
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

## Included Packages

| Package | Version |
| --- | --- |
| Tcl | 8.7a4 |
| Thread | 2.9a1 |
| tdbc | 1.1.1 |
| pgwire | 3.0.0b10 |
| tdom | 0.9.3 |
| tls | 1.7.22 |
| parse_args | 0.3.2 |
| rl_json | 0.11.0 |
| hash | 0.3 |
| unix_sockets | 0.2 |
| tcllib | 1.20 |
| gc_class | 1.0 |
| rl_http | 1.9 |
| sqlite3 | 3.35.4 |
| tcc4tcl | 0.30.1 |
| cflib | 1.15.2 |
| sop | 1.7.2 |
| netdgram | 0.9.12 |
| evlog | 0.3.1 |
| dsl | 0.4 |
| logging | 0.3 |
| sockopt | 0.2 |
| crypto | 0.6 |
| m2 | 0.43.15 |
| urlencode | 1.0 |
| hmac | 0.1 |
| tclreadline | 2.3.8.1 |
| Expect | 5.45.4 |
| tclsignal | 1.4.4.1 |
| type | 0.2 |
| inotify | 2.2 |
| Pixel | 3.5 |
| Pixel_jpeg | 1.4 |
| Pixel_png | 2.6 |
| Pixel_webp | 1.0 |
| Pixel_imlib2 | 1.2.0 |
| chantricks | 1.0.3 |
| openapi | 0.4.11 |
| docker | 0.9.0 |
| aws | 1.2 |
| aws1::s3 | 1.0 |
| aws1::cognito_identity | 1.0 |
| aws1::secretsmanager | 0.1 |
| aws1::ecr | 1.0 |
| aws | 2.0a2 |
| parsetcl | 0.1 |
| tty | 0.4 |
| datasource | 0.2.4 |
| flock | 0.6 |
| ck | 8.6 |
| resolve | 0.3 |

