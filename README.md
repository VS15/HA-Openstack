# ha-openstack
High Availability Openstack. This project is using latest DevOps tools such as vagrant and ansible and best practices to auto-deploy and auto-configure high availability cluster of openstack services within less than 10 minutes. Fully automated. 
(You need to have vagrant, virtual box installed on your system and download the image which is being used for the VMs. The rest will be done automatically)

Here is the architecture snapshot: 

Front tier:

192.168.1.30 - LTM based on HAPROXY 1.5. Round Robin balancing mode
192.168.1.31 - LTM based on HAPROXY 1.5  Round Robin balancing mode
192.168.1.32 - VIP in front of the HAPROXY LTMs maagend by keepalived. The VIP is used by all openstack services.

Back tier
192.168.1.33 - MariaDb installation with full replication by Galera
192.168.1.34 - MariaDb installation with full replication by Galera

Middle tier: 
192.168.1.35 - Openstack Services configured to be accessible through the VIP 192.168.1.32
192.168.1.36 - Openstack Services configured to be accessible through the VIP 192.168.1.32

Both boxes are running the following Openstack Services: 
- rabbitmq
- keystone
- glance
- nova
- horizon


