###
#
#	Yves Vindevogel (vindevoy)
#	2019-10-25
#
#	Basic CentOS 8 image with possibility to change the timezone
#
###
 
FROM centos:8

MAINTAINER Yves Vindevogel (vindevoy) - yves.vindevogel@asynchrone.com

ARG TZ_REGION=Europe
ARG TZ_CITY=Brussels

RUN dnf update -y
RUN dnf autoremove -y
RUN dnf clean all -y
RUN rm -rf /var/cache/dnf

RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/$TZ_REGION/$TZ_CITY /etc/localtime

CMD ["/bin/sh"]
