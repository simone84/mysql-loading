FROM centos:6
RUN mkdir /tmp/updating-scripts
ADD updating-scripts /tmp/updating-scripts
ADD mysql-updatetables1_2.sh /tmp/
RUN yum install -y mysql-server
ADD run.sh /root/ 
RUN /root/run.sh
ENTRYPOINT service mysqld start && bash
