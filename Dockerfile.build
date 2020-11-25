FROM centos:8

MAINTAINER Yves Vindevogel (vindevoy) - yves.vindevogel@asynchrone.com

ARG TZ_REGION=Europe
ARG TZ_CITY=Brussels

RUN set -x && \ 
    dnf update -y && \ 
    dnf autoremove -y && \ 
    dnf clean all -y && \ 
    rm -rf /var/cache/dnf && \ 
    rm -f /etc/localtime && \ 
    ln -s /usr/share/zoneinfo/$TZ_REGION/$TZ_CITY /etc/localtime

CMD ["/bin/sh"]
