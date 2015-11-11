# This dockerfile uses to build a image to run DB2 10.5.0.5 on CentOS 7
# VERSION 1
# Author: Fu Xin Feng

# Base image to use, this must be set as the first line
FROM centos:7

MAINTAINER fuxinf fuxinf@cn.ibm.com

COPY ../db2_v10.5_linuxx64_expc.tar.gz /home/db2_v10.5_linuxx64_expc.tar.gz
cOPY ./db2expc.rsp /home/db2expc.rsp

RUN yum update -y

# Install required libraries
RUN yum install libstdc++.i686 pam.i686 libaio -y

RUN cd /home && tar xzvf db2_v10.5_linuxx64_expc.tar.gz

# Execute the db2 install program
#RUN /home/expc/db2_install -b /opt/ibm/db2/V10.5 -p EXPC -n
#RUN /home/expc/db2setup -r /home/db2expc.rsp

#RUN groupadd dasadm1 && groupadd db2fadm1 && groupadd db2iadm1

#RUN useradd db2inst1 -g db2iadm1
#RUN useradd db2fenc1 -g db2fadm1
#RUN useradd dasusr1 -g dasadm1

#RUN /opt/ibm/db2/V10.5/instance/db2icrt -u db2fenc1 db2inst1

#RUN /opt/ibm/db2/V10.5/bin/db2ilist

RUN rm -R /home/db2_v10.5_linuxx64_expc.tar.gz
#RUN rm -R /home/expc

EXPOSE 50000

#CMD ["/etc/init.d/db2exc start && /bin/bash"]
CMD ["/bin/bash"]


