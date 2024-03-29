FROM ubuntu/nginx:latest
USER root
RUN apt-get update -y && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  apache2 \
  apg \
  festival \
  imagemagick \
  libavcodec-extra \
  libavfilter-extra \
  mysql-server \
  vorbis-tools

RUN apt-get update -y 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN apt-add-repository ppa:ondrej/php -y
RUN apt-get update -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  php7.4 \
  php7.4-fpm \
  php7.4-mysql \
  php7.4-mysql \
  php7.4-mbstring \
  php7.4-xml \
  php7.4-gd \
  php7.4-curl \
  php7.4-cli \
  php7.4-imagick

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  ufw \
  systemd \
  git

# Remove the files initailly created by apache
RUN rm -dfr /var/www/html

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ffmpeg;
RUN ln -s /usr/bin/ffmpeg /usr/local/bin/avconv
RUN ln -s /usr/bin/ffprobe /usr/local/bin/avprobe

RUN mkdir /home/media && chmod 777 /home/media;
RUN mkdir /home/media/uploads && chmod 777 /home/media/uploads;
RUN mkdir /home/media/archive && chmod 777 /home/media/archive;
RUN mkdir /home/media/cache && chmod 777 /home/media/cache;
RUN mkdir /home/assets && chmod 777 /home/assets;

WORKDIR /var/www/html

# Own /var/www/html
RUN chmod 755 .

ARG USER=obsuser
ARG OBCONF_PASS
ARG OBCONF_EMAIL
ARG MYSQL_PASS
ARG OB_UPDATES_PW
ARG OBCONF_URL
ARG OBCONF_SALT
ARG OB_DB_HOST=mysql-db:3306
ARG OB_DB_NAME=obdb

RUN useradd obsuser > /dev/null 2>&1  && \
  usermod -a -G obsuser obsuser > /dev/null 2>&1  && \
  usermod -a -G www-data obsuser > /dev/null 2>&1

RUN mkdir -p /home/assets/uploads
RUN chown -R www-data /home/media /home/assets
RUN find /home/media/ -type d -exec chmod 0775 {} \;
RUN find /home/media/ -type f -exec chmod 0664 {} \;

# Pipe NGINX logs to docker terminal
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

# Link available config to enabled NGINX directory
RUN ln -s /etc/nginx/sites-available/observer.conf /etc/nginx/sites-enabled/

ARG REPOSITORY=https://github.com/openbroadcaster/observer.git
ENV REPOSITORY=$REPOSITORY

ARG COMMIT
ENV COMMIT=$COMMIT

RUN git clone $REPOSITORY /var/www/html
RUN git checkout $COMMIT

ARG MODULE_NAMES
ARG MODULE_REPOSITORIES

SHELL ["/bin/bash", "-c"]

RUN \
declare -a MODULES=$MODULE_NAMES;\
declare -a REPOS=$MODULE_REPOSITORIES;\
INDEX=0;\
for module in $MODULES; do \
  repository=${REPOS[$INDEX]};\
  echo "Installing module $INDEX: '$module' from '$repository'";\
  git clone $repository /var/www/html/modules/$module; \
  INDEX=$((INDEX + 1));\
done;

SHELL ["/bin/sh", "-c"]

RUN echo '\
<?php\n\
const OB_HASH_SALT = "'$OBCONF_SALT'";\n\
const OB_DB_USER = "'$USER'";\n\
const OB_DB_PASS = "'$OB_DB_PASS'";\n\
const OB_DB_HOST = "'OB_DB_HOST'";\n\
const OB_DB_NAME = "'$OB_DB_NAME'";\n\
const OB_MEDIA = "/home/media";\n\
const OB_MEDIA_UPLOADS = "/home/media/uploads";\n\
const OB_MEDIA_ARCHIVE = "/home/media/archive";\n\
const OB_CACHE = "/home/media/cache";\n\
const OB_ASSETS = "/home/assets";\n\
const OB_SITE = "'$OBCONF_URL'";\n\
const OB_EMAIL_REPLY = "'$OBCONF_EMAIL'";\n\
const OB_EMAIL_FROM = "OpenBroadcaster";\n\
const OB_UPDATES_USER = "updates";\n\
const OB_UPDATES_PW = "'$OB_UPDATES_PW'";\n\
?>' >> /var/www/html/config.php;

# MYSQL
# RUN mysqladmin create $OB_DB_NAME
# RUN mysql -u root -e "CREATE USER '$USER'@'localhost' IDENTIFIED BY '$MYSQL_PASS'; GRANT ALL PRIVILEGES ON $OB_DB_NAME. * TO '$USER'@'localhost'; FLUSH PRIVILEGES;"
# RUN mysql obdb < /var/www/html/db/dbclean.sql

# RUN /var/www/html/tools/password_change.php "admin" "$OBCONF_PASS" && exit 125

RUN pip install ffmpeg-normalize

COPY ./startup.sh /home/startup.sh

ENTRYPOINT ["/bin/bash", "/home/startup.sh"]

EXPOSE 80
EXPOSE 443
EXPOSE 465
EXPOSE 25
