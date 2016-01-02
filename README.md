# haopenstack
</head>

<body bgcolor=white lang=EN-US link="#0563C1" vlink="#954F72" style='tab-interval:
.5in'>

<div class=WordSection1>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>High Availability Openstack
Cluster</span></b><span style='font-family:"Times New Roman"'>. This project is
using the latest <b style='mso-bidi-font-weight:normal'>DevOps</b> tools such
as <b style='mso-bidi-font-weight:normal'>Vagrant</b>, <b style='mso-bidi-font-weight:
normal'>Ansible and other open source solutions</b>. It uses the best practices
for </span><span style='font-family:"Times New Roman";mso-fareast-font-family:
"Times New Roman";color:#555555;background:#FDFDFD'>enterprise deployment</span><span
style='font-family:"Times New Roman";mso-fareast-font-family:"Times New Roman"'>
</span><span style='font-family:"Times New Roman"'>and auto-configuration of a redundant
cluster of Openstack services, fronted with 2 load-balancers with a failover
capability, redundant Openstack Services in the middle tier and redundant
MariaDb database cluster with replication using Galera. All servers are running
Ubuntu 14.04. </span><span style='font-family:"Times New Roman";mso-fareast-font-family:
"Times New Roman"'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>(You
need to have vagrant, virtual box installed on your system.) In ideal
conditions it should take less than 15 minutes for deployment, sometimes it
takes longer depending on the multiple factors.)<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'><a
href="https://www.vagrantup.com/downloads.html">https://www.vagrantup.com/downloads.html</a><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'><a
href="https://www.virtualbox.org/wiki/Downloads">https://www.virtualbox.org/wiki/Downloads</a><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>The
rest will be done automatically once you run <b style='mso-bidi-font-weight:
normal'>./start.sh</b><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>Architecture summary: <o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>Front tier Ð LTMs with
failover capability:<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>192.168.1.30
- LTM based on HAPROXY 1.5 Round Robin <o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>192.168.1.31
- LTM based on HAPROXY <span class=GramE>1.5<span
style='mso-spacerun:yes'>&nbsp; </span>Round</span> Robin <o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>192.168.1.32
- VIP in front of the HAPROXY LTMs managed by <b style='mso-bidi-font-weight:
normal'>Keepalived</b>. The VIP is used by all Openstack services.<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>Middle tier Ð Openstack
Services: <o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>192.168.1.35
- Openstack Services configured to be accessible through the VIP 192.168.1.32<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>192.168.1.36
- Openstack Services configured to be accessible through the VIP 192.168.1.32<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>Back tier Ð Database
cluster:<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>192.168.1.33
- MariaDb installation with asynchronous replication by Galera<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>192.168.1.34
- MariaDb installation with asynchronous replication by Galera<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-family:"Times New Roman"'>Middle
tier boxes are running core Openstack Services: <o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>- rabbitmq<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>- keystone<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>- glance<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>- nova<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-family:"Times New Roman"'>- cinder<o:p></o:p></span></b></p>

</div>

</body>

</html>

