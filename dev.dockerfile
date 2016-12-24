FROM centos:7.0.1406
#docker 版本中的centos 使用假的systemd，需要先安装真正的systemd才可继续进行
RUN yum swap -- remove fakesystemd -- install systemd systemd-libs \
    && yum install -y wget tar gcc gcc-c++  make zlib zlib-devel pcre pcre-devel  libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers libxml2 libxml2-devel openssl.x86_64 openssl-devel.x86_64 -y  libjpeg.x86_64 libpng.x86_64 freetype.x86_64 libssh2-devel libjpeg-devel.x86_64 libpng-devel.x86_64 php-mcrypt  libmcrypt php-mcrypt  libmcrypt   libmcrypt.x86_64 libmcrypt-devel.x86_64 libmcrypt-devel  libmcrypt-devel freetype-devel.x86_64 \
    && cd /root && wget http://am1.php.net/distributions/php-7.1.0.tar.gz \
    && tar zxvf php-7.1.0.tar.gz && cd php-7.1.0 \
    && ./configure --enable-fpm --with-mysql --disable-fileinfo  --with-openssl --with-zip --with-mbstring --enable-mbstring=all --with-ssh2 --with-curl \
    && make && make install && cp php.ini-development /usr/local/lib/php.ini
