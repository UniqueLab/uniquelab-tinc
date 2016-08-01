# uniquesc-hosts
unique sc hosts file for tinc

# Step to configure tinc
 ```bash
 $ git clone https://github.com/UniqueLab/uniquesc-hosts
 $ cd uniquesc-hosts
 $ mv uniquesc-hosts /etc/tinc
 ```
Chose a unique number from 2-254 for your own private address. Generate your host file to `/etc/tinc/uqniuesc-hosts/hosts/` and modify your configuration files.

 ```bash
 $ echo 'Subnet = 10.143.0._yournumber_/24' > /etc/tinc/uqniuesc-hosts/hosts/yourhostname
 $ vim /etc/tinc/uniquesc-hosts/tinc.conf
 $ vim /etc/tinc/uniquesc-hosts/tinc-up
 $ vim /etc/tinc/uniquesc-hosts/tinc-down
 $ tincd -n uniquesc-hosts -K
 ```
Open a issue and submit your your host file.

# Autostart
 ```bash
 $ systemctl enable tinc --now
 $ systemctl enable tinc@unqiuesc-hosts --now
 ```


