# avahi-alias


## Depends

- avahi-publish

```
sudo apt install avahi-utils
```

## Make

```
# Usage: ./make.sh <network_interface> <domain_alias>
./make.sh eth0 mydomain

# creating avahi-alias@mydomain.service
```


## Install

```
# Usage: ./install.sh <domain_alias>
sudo ./install.sh mydomain
```

## Uninstall

```
# Usage: ./uninstall.sh <domain_alias>
sudo ./uninstall.sh mydomain
```

## List.
```
systemctl list-unit-files -t service | grep avahi-alias
avahi-alias@mydomain.service                enabled         enabled
```
