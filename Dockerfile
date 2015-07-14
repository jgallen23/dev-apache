FROM gregallen/dev


RUN echo 'mysql-server-5.1 mysql-server/root_password password wordpress' | debconf-set-selections && \
  echo 'mysql-server-5.1 mysql-server/root_password_again password wordpress' | debconf-set-selections

RUN apt-get -y install mysql-client mysql-server-5.5 apache2 php5 libapache2-mod-php5 php5-mysql php5-curl php5-gd

RUN a2enmod rewrite

ADD start /dev-start

ADD default.conf /etc/apache2/sites-available/000-default.conf
