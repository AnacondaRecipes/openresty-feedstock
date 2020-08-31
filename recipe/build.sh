#!/bin/bash

./configure --prefix=$PREFIX --without-http_redis2_module --without-http_redis_module \
	--error-log-path=$PREFIX/var/log/nginx/error.log \
	--pid-path=$PREFIX/var/run/nginx.pid \
	--http-log-path=$PREFIX/var/log/nginx/access.log \
	--with-cc=$CC \
        --with-cc-opt="-I $PREFIX/include" \
        --with-ld-opt="-L $PREFIX/lib"

make -j 8
make install

mkdir -p $PREFIX/var/log/nginx
mkdir -p $PREFIX/var/run

touch $PREFIX/var/log/nginx/.gitkeep
touch $PREFIX/var/run/.gitkeep
