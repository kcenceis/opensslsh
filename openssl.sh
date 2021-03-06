#/bin/sh

OPENTAR=openssl-1.1.1g

yum install gcc zlib zlib-devel openssl openssl-devel pcre wget perl tar -y

if [ ! -d "/tmp/${OPENTAR}.tar.gz" ]; then
  rm -rf /tmp/openssl-*
fi


wget -P /tmp/ https://www.openssl.org/source/${OPENTAR}.tar.gz

tar zxvf /tmp/${OPENTAR}.tar.gz -C /tmp/


cd /tmp/${OPENTAR}

./config --prefix=/usr/local/openssl/.openssl/ shared zlib

make clean

make depend

make

make install


if [ ! -d "/usr/bin/openssl.bak" ]; then
  rm -rf /usr/bin/openssl.bak
fi
if [ ! -d "/usr/include/openssl.bak" ]; then
  rm -rf /usr/include/openssl.bak
fi
if [ ! -d "/usr/lib64/libssl.so.bak" ]; then
  rm -rf /usr/lib64/libssl.so.bak
fi
if [ ! -d "/usr/lib64/libcrypto.so.bak" ]; then
  rm -rf /usr/lib64/libssl.so.bak
fi
if [ ! -d "/usr/lib64/libcrypto.so.1.1.bak" ]; then
  rm -rf /usr/lib64/libssl.so.bak
fi
if [ ! -d "/usr/lib64/libssl.so.1.1.bak" ]; then
  rm -rf /usr/lib64/libssl.so.bak
fi

mv /usr/bin/openssl /usr/bin/openssl.bak
mv /usr/include/openssl /usr/include/openssl.bak
mv /usr/lib64/libssl.so /usr/lib64/libssl.so.bak
mv /usr/lib64/libcrypto.so /usr/lib64/libcrypto.so.bak
mv /usr/lib64/libssl.so.1.1 /usr/lib64/libssl.so.1.1.bak
mv /usr/lib64/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1.bak
ln -s /usr/local/openssl/.openssl/bin/openssl /usr/bin/openssl  
ln -s /usr/local/openssl/.openssl/include/openssl /usr/include/openssl
ln -s /usr/local/openssl/.openssl/lib/libssl.so /usr/lib64/libssl.so
ln -s /usr/local/openssl/.openssl/lib/libcrypto.so /usr/lib64/libcrypto.so
ln -s /usr/local/openssl/.openssl/lib/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1
ln -s /usr/local/openssl/.openssl/lib/libssl.so.1.1 /usr/lib64/libssl.so.1.1
ldconfig -v

openssl version -a

rm -rf /tmp/${OPENTAR}*
