FROM centos:latest
LABEL io.openshift.expose-services="8080:http"
RUN yum install httpd -y && \
    yum clean all -y
COPY src/index.html /var/www/html/
RUN sed -i "s/listen 80/listen 8080/g" /etc/httpd/conf/httpd.conf
RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \
    chmod -R g=u /var/log/httpd /var/run/httpd
USER 1001
EXPOSE 8080
CMD ["usr/sbin/httpd", "-D", "FOREGROUND"]
