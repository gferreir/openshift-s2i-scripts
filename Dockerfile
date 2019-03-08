FROM centos:7
EXPOSE 8080
LABEL io.openshift.expose-services="8080:http"
RUN yum install httpd && \
    yum clean all
RUN sed -i "s/listen 80/listen 8080/g" /etc/httpd/conf/httpd.conf
RUN chgrp -R 0 /var/log/httpd24 /var/run/httpd && \
    chmod -R g=u /var/log/httpd24 /var/run/httpd
USER 1001
