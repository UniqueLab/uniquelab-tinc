# uniquesc-hosts
tinc configure & host file of Unique Lab


# Step to configure tinc
 ```bash
 $ git clone https://github.com/UniqueLab/uniquelab-tinc
 $ cd uniquelab-tinc
 $ ./generate.sh
 ```
Chose a unique number from *101-254* for your own private address. 

Open a issue and submit your your host file.

# Autostart

### Arch
 ```bash
 $ systemctl enable tinc --now
 $ systemctl enable tinc@unqiuelab-tinc --now
 ```
