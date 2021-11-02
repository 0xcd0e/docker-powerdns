# PowerDNS Docker Container

* Small Alpine based Image
* MySQL, Postgres, SQLite and Bind backend included
* DNSSEC support optional
* PowerDNS version 4.6.0-alpha1
* Graceful shutdown using pdns_control

## Usage

```shell
$ docker run --name pdns \
  -p 53:53 \
  -p 53:53/udp \
  0xzz/powerdns:latest \
    --cache-ttl=60 \
    --allow-axfr-ips=127.0.0.1,10.0.1.2
```

## Configuration

**PowerDNS Configuration:**

Append the PowerDNS setting to the command as shown in the example above.
See `docker run --rm 0xzz/powerdns --help`


## License

[GNU General Public License v2.0](https://github.com/PowerDNS/pdns/blob/master/COPYING) applyies to PowerDNS and all files in this repository.

### Credits

* Christoph Wiechert <wio@psitrax.de>

