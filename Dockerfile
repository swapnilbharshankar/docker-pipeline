# Base image
FROM centos:6 

# Arguments
ARG NAME=wordpress
ARG WORDPRESS_VERSION=${NAME}-5.0.3

# Work location
WORKDIR /var/www/html

# Install update the 
RUN yum update -y && yum install tar gzip httpd php-gd php php-mysql -y 

# Download wordpress site

ADD http://wordpress.org/${WORDPRESS_VERSION}.tar.gz .

RUN tar -xvzf ${WORDPRESS_VERSION}.tar.gz wordpress/

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

#########################################

COPY ./check_service.sh .

RUN chmod 755 check_service.sh

#RUN ./check_service.sh

# Install Jetty
#COPY ./jetty/ jetty/

#RUN adduser -r -m jetty && chown -R jetty:jetty jetty && cp jetty/bin/jetty.sh /etc/init.d/jetty && chkconfig --add jetty && chkconfig --level 345 jetty on

#RUN export JAVA_HOME=/usr/java/default && export JAVA=$JAVA_HOME/bin/java && export JAVA_OPTIONS=" -server -Xms256m -Xmx1024m -XX:+DisableExplicitGC " 

#RUN export JETTY_HOME=/var/www/html/jetty/

#RUN export JETTY_USER=jetty 

#RUN export JETTY_PORT=8080

#RUN export JETTY_HOST=0.0.0.0

#RUN export JETTY_LOGS=/var/www/html/jetty/logs/

#COPY ./start_jetty.sh .
