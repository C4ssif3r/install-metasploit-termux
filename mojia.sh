#!/data/data/com.termux/files/usr/bin/bash


mojia_banner() {

    local banner=(
"┳┳┓  ••"
"┃┃┃┏┓┓┓┏┓"
"┛ ┗┗┛┃┗┗┻ "
"┳┳┓        ┓  •   ┳  ┛   ┓┓"
"┃┃┃┏┓╋┏┓┏┏┓┃┏┓┓╋  ┃┏┓┏╋┏┓┃┃┏┓┏┓"
"┛ ┗┗ ┗┗┻┛┣┛┗┗┛┗┗  ┻┛┗┛┗┗┻┗┗┗ ┛ "
"         ┛"
)

    echo -e "\e[34m" # Blue color
    for line in "${banner[@]}"; do
        printf "%*s\n" $(( (${#line}) / 2 )) "$line"
    done
    echo -e "\e[0m" # Reset color
}

clear
mojia_banner


echo "\nPLZ WAIT ...\nMojia going to install msf6..."
source <(echo "c3Bpbm5lcj0oICd8JyAnLycgJy0nICdcJyApOwoKY291bnQoKXsKICBzcGluICYKICBwaWQ9JCEKICBmb3IgaSBpbiBgc2VxIDEgMTBgCiAgZG8KICAgIHNsZWVwIDE7CiAgZG9uZQoKICBraWxsICRwaWQgIAp9CgpzcGluKCl7CiAgd2hpbGUgWyAxIF0KICBkbyAKICAgIGZvciBpIGluICR7c3Bpbm5lcltAXX07IAogICAgZG8gCiAgICAgIGVjaG8gLW5lICJcciRpIjsKICAgICAgc2xlZXAgMC4yOwogICAgZG9uZTsKICBkb25lCn0KCmNvdW50" | base64 -d)

# Dependencies
echo "\n\n★ mojia now go to installing Dependencies...\n"
pkg update -y
pkg upgrade -y -o Dpkg::Options::="--force-confnew"
pkg install -y binutils python autoconf bison clang coreutils curl findutils apr apr-util postgresql openssl readline libffi libgmp libpcap libsqlite libgrpc libtool libxml2 libxslt ncurses make ncurses-utils ncurses git wget unzip zip tar termux-tools termux-elf-cleaner pkg-config git ruby -o Dpkg::Options::="--force-confnew"
python3 -m pip install requests

# Fix .rb Big Decimal 
#center "* Fix ruby BigDecimal"
#source <(curl -sL https://github.com/termux/termux-packages/files/2912002/fix-ruby-bigdecimal.sh.txt)

# del old msf
echo "\n\n★ deleting old msf6 folder...\n"
if [ -d "${PREFIX}/opt/metasploit-framework" ]; then
  rm -rf ${PREFIX}/opt/metasploit-framework
fi

# Download Msf 6
echo "\n\n★ mojia now Downloading msf6 ...\n"
if [ ! -d "${PREFIX}/opt" ]; then
  mkdir ${PREFIX}/opt
fi
git clone https://github.com/rapid7/metasploit-framework.git --depth=1 ${PREFIX}/opt/metasploit-framework

# Install
center "\n\n★Mojia msf installer ...\n"
cd ${PREFIX}/opt/metasploit-framework
gem install bundler
NOKOGIRI_VERSION=$(cat Gemfile.lock | grep -i nokogiri | sed 's/nokogiri [\(\)]/(/g' | cut -d ' ' -f 5 | grep -oP "(.).[[:digit:]][\w+]?[.].")


# by overriding cflags nokogiri will install or you can simply declare a void function 
#  you might have seen this error while installing nokogiri `xmlSetStructuredErrorFunc((void *)rb_error_list, Nokogiri_error_array_pusher);`
#  solution : void xmlSetStructuredErrorFunc(void *rb_error_list, void *Nokogiri_error_array_pusher); you can set any parameter name 
#  for sake of simplicity tweaking cflags is better than declaring a void function for every c file

gem install nokogiri -v $NOKOGIRI_VERSION -- --with-cflags="-Wno-implicit-function-declaration -Wno-deprecated-declarations -Wno-incompatible-function-pointer-types" --use-system-libraries
bundle install
gem install actionpack
bundle update activesupport
bundle update --bundler
bundle install -j$(nproc --all)

# Msf linking
ln -sf ${PREFIX}/opt/metasploit-framework/msfconsole ${PREFIX}/bin/
ln -sf ${PREFIX}/opt/metasploit-framework/msfvenom ${PREFIX}/bin/
ln -sf ${PREFIX}/opt/metasploit-framework/msfrpcd ${PREFIX}/bin/
termux-elf-cleaner ${PREFIX}/lib/ruby/gems/*/gems/pg-*/lib/pg_ext.so

# print success 
echo -e "\033[32m" 
center "Mojia msf Installer complete✓"
echo -e "\nRUN Metasploit using this command: msfconsole"
echo -e "\033[0m"
