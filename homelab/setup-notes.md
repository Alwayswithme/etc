# allow port
```bash
# for nginx revese proxy
sudo ufw allow 443

# code server port
sudo ufw allow 8080

# bittorrent 42473
sudo ufw allow 42473

# nas-tools access bridge network
docker network connect bridge nas-tools

# jellyfin port
sudo ufw allow 8096
```

## DDNS
```
#get IPV6
ip -6 addr | grep inet6 | grep 'global dynamic' | awk -F '[ \t]+|/' '$3 == "::1" { next;} $3 ~ /^fe80::/ { next;} /inet6/ {print $3}'

crontab -e 
*/5 * * * * . /path/to/.env && /path/to/duck.sh your_domain your_token
```

## Docker bridge network IPV6
       │ File: /etc/docker/daemon.json
───────┼────────────────────────────────────────────────────────
   1   │ {
   2   │   "ipv6": true,
   3   │   "fixed-cidr-v6": "2001:db1:1::/64",
   4   │   "ip6tables": true,
   5   │   "experimental": true,
   6   │   "registry-mirrors": [
   7   │     "https://dockerproxy.cn",
   8   │     "https://dockerhub.icu"
   9   │   ]
  10   │ }
  11   │ 


## remove qinglong Sentry
```bash
docker exec qinglong-web-1 sed -i '/Sentry\.init/ s/^/return;/' /ql/static/build/loaders/sentry.js
```