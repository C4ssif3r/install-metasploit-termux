#### install metasploit 6 in termux! no root full automatically XD



![Metasploit Badge](https://img.shields.io/badge/Metasploit-2596CD?logo=metasploit&logoColor=fff&style=for-the-badge) ![t.me/iranPwner](https://img.shields.io/badge/Powered%20By%20%E2%A5%8F%CF%BB0Jia-8A2BE2) ![GNU Bash Badge](https://img.shields.io/badge/GNU%20Bash-4EAA25?logo=gnubash&logoColor=fff&style=for-the-badge)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

### read Before installing ( !important )

• In order to have updated Termux:

  - Uninstall and reinstall latest Termux version from [F-Droid / click to download!](https://f-droid.org/repo/com.termux_118.apk) (Version on google Play Store is outdated)!
  - Then launch Termux to initialization when ended close it !
  - Re-open termux app and follow instructions below ↓


+ **auto installing ↓**


```bash
source <(curl -fsSL https://raw.githubusercontent.com/C4ssif3r/install-metasploit-termux/main/mojia.sh)
```


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)


+ **manual installing ↓**


```bash

apt install wget -y

wget https://raw.githubusercontent.com/C4ssif3r/install-metasploit-termux/main/mojia.sh

chmod +x metasploit.sh

./metasploit.sh
```

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)



##### Fix ruby BigDecimal (if get error BigDecimal)

```bash
source <(curl -sL https://github.com/termux/termux-packages/files/2912002/fix-ruby-bigdecimal.sh.txt)
```

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)


- note:
    + by overriding cflags nokogiri will install or you can simply declare a void function

    + you might have seen this error while installing nokogiri 'xmlSetStructuredErrorFunc((void *)rb_error_list, Nokogiri_error_array_pusher);'

    + solution : void xmlSetStructuredErrorFunc(void *rb_error_list, void *Nokogiri_error_array_pusher); you can set any parameter name

    + for sake of simplicity tweaking cflags is better than declaring a void function for every c file


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

**if you gave error, message me on**

[![My Telegram](https://img.shields.io/badge/Telegram-100000?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/AboutMji)
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)
