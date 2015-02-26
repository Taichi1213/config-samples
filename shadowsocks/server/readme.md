Configure Shadowsocks with Supervisor
================================================

[Shadowsocks](https://github.com/clowwindy/shadowsocks)

[Configure Shadowsocks with Supervisor](https://github.com/clowwindy/shadowsocks/wiki/Configure-Shadowsocks-with-Supervisor)

[Optimizing Shadowsocks](https://github.com/clowwindy/shadowsocks/wiki/Optimizing-Shadowsocks)

CentOS
------------------------------------------------

Run

    $ yum update
    $ yum install python-setuptools supervisor
    $ easy_install pip
    $ pip install shadowsocks

Create `/etc/shadowsocks.json`

```json
{
    "server": "0.0.0.0",
    "server_port": 8388,
    "local_address": "127.0.0.1",
    "local_port": 1080,
    "password": "mypassword",
    "timeout": 300,
    "method": "aes-256-cfb",
    "fast_open": false,
    "workers": 2
}
```

Edit `/etc/supervisord.conf`, add

```conf
[program:shadowsocks]
command=ssserver -c /etc/shadowsocks.json
autorestart=true
user=nobody
```

Run

    $ sudo chkconfig --add supervisord
    $ sudo chkconfig supervisord on
    $ service supervisor start
    $ supervisorctl reload

Edit `/etc/sysconfig/iptables`, add

```
-A INPUT -m state --state NEW -m tcp -p tcp --dport your_server_port -j ACCEPT
```
