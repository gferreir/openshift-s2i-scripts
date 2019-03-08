FROM registry.access.redhat.com/rhscl/httpd-24-rhel7
EXPOSE 8080
LABEL io.openshift.expose-services="8080:http"
RUN sed -i "s/listen 80/listen 8080/g" /etc/nginx.conf
RUN chgrp -R 0 /var/opt/rh/rh-nginx18 && \
    chmod -R g=u /var/opt/rh/rh-nginx18
USER 1001
