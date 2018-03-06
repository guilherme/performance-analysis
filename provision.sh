set -ex
mkdir -p /usr/local/etc \
  && { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

# DEBUG SYMBOLS PACKAGES
echo "deb http://ddebs.ubuntu.com $(lsb_release -cs) main restricted universe multiverse
 deb http://ddebs.ubuntu.com $(lsb_release -cs)-updates main restricted universe multiverse
 deb http://ddebs.ubuntu.com $(lsb_release -cs)-proposed main restricted universe multiverse" | \
sudo tee -a /etc/apt/sources.list.d/ddebs.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 428D7C01 C8CAB6595FDFF622
sudo apt-get update
sudo apt-get install -y systemtap \
    systemtap-sdt-dev \
    wget \
    build-essential \
    autoconf \
    zlib1g-dev \
    libssl-dev \
    openssl \
    bison \
    dpkg-dev \
    libgdbm-dev \
    linux-headers-$(uname -r) \
    linux-image-$(uname -r)-dbgsym \
    libreadline-dev \
    git-core

sudo adduser vagrant stapusr
sudo adduser vagrant stapdev
sudo adduser vagrant stapsys


