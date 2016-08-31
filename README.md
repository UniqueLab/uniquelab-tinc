# uniquesc-hosts
unique sc hosts file for tinc


# Step to configure tinc
 ```bash
 $ git clone https://github.com/UniqueLab/uniquesc-hosts
 $ cd uniquesc-hosts
 $ ./generate.sh
 ```
Chose a unique number from 101-254 for your own private address. Generate your host file to `/etc/tinc/uqniuesc-hosts/hosts/` and modify your configuration files.

Open a issue and submit your your host file.

# Autostart

### Arch
 ```bash
 $ systemctl enable tinc --now
 $ systemctl enable tinc@unqiuesc-hosts --now
 ```
