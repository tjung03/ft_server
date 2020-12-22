FROM	debian:buster

LABEL	maintainer="tjung@student.42seoul.kr"

RUN		apt-get update && apt-get -y upgrade
RUN		apt-get -y install \
		nginx \
		mariadb-server \
		php-mysql \
		php-mbstring \
		php7.3-fpm \
		openssl \
		vim \
		wget

COPY	srcs/start.sh ./
COPY	srcs/default ./tmp/
COPY	srcs/config.inc.php ./tmp/
COPY	srcs/wp-config.php ./tmp/

EXPOSE	80 443

CMD		bash start.sh
