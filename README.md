cx is a script wrapper for basic things you want to do with lxc.
It has many intentional similarities to the lxd project, but has
none of the dependencies.

Most cx commands take extra options that are forwarded to the lxc
counterpart.  E.g.,

    cx start foo -l debug -o /tmp/foo
	
Calls

    lxc-start -n foo -l debug -o /tmp/foo

For systems with [Finit][], cx automatically creates service `.conf` for
new containers in `/etc/finit.d/`.  Stopping and starting containers can
then be done using:

    initctl start container:foo
    initctl stop  container:foo

----

This project was once part of [myLinux][], intended to run small
containers built with [myRootFS][], but it can be used anywhere.

[Finit]:    https://github.com/troglobit/finit
[myLinux]:  https://github.com/myrootfs/myLinux
[myRootFS]: https://github.com/myrootfs/myrootfs
