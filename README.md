
</head>

<body bgcolor=white lang=EN-US style='tab-interval:.5in'>

<div class=WordSection1>

<p class=MsoNormal># ha-<span class=SpellE>openstack</span><o:p></o:p></p>

<p class=MsoNormal>High Availability <span class=SpellE><b style='mso-bidi-font-weight:
normal'>Openstack</b></span>. This project is using latest <span class=SpellE><b
style='mso-bidi-font-weight:normal'>DevOps</b></span> tools such as <b
style='mso-bidi-font-weight:normal'>vagrant</b> and <span class=SpellE><b
style='mso-bidi-font-weight:normal'>ansible</b></span> and best practices to
auto-deploy and auto-configure high availability cluster of <span class=SpellE>openstack</span>
services within less than 10 minutes. Fully automated. <o:p></o:p></p>

<p class=MsoNormal>(You need to have vagrant, virtual box installed on your
system and download the image which is being used for the VMs. The rest will be
done automatically)<o:p></o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>Here is the architecture snapshot: <o:p></o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>Front tier:<o:p></o:p></b></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>192.168.1.30 - LTM based on HAPROXY 1.5. Round Robin balancing
mode<o:p></o:p></p>

<p class=MsoNormal>192.168.1.31 - LTM based on HAPROXY <span class=GramE>1.5<span
style='mso-spacerun:yes'>&nbsp; </span>Round</span> Robin balancing mode<o:p></o:p></p>

<p class=MsoNormal>192.168.1.32 - VIP in front of the HAPROXY LTMs <span
class=SpellE>maagend</span> by <span class=SpellE>keepalived</span>. The VIP is
used by all <span class=SpellE>openstack</span> services.<o:p></o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>Back tier<o:p></o:p></b></p>

<p class=MsoNormal>192.168.1.33 - <span class=SpellE>MariaDb</span>
installation with full replication by <span class=SpellE>Galera</span><o:p></o:p></p>

<p class=MsoNormal>192.168.1.34 - <span class=SpellE>MariaDb</span>
installation with full replication by <span class=SpellE>Galera</span><o:p></o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>Middle tier: <o:p></o:p></b></p>

<p class=MsoNormal>192.168.1.35 - <span class=SpellE>Openstack</span> Services
configured to be accessible through the VIP 192.168.1.32<o:p></o:p></p>

<p class=MsoNormal>192.168.1.36 - <span class=SpellE>Openstack</span> Services
configured to be accessible through the VIP 192.168.1.32<o:p></o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>Both boxes are running the following <span class=SpellE>Openstack</span>
Services: <o:p></o:p></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>- <span class=SpellE>rabbitmq</span><o:p></o:p></b></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>- keystone<o:p></o:p></b></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>- glance<o:p></o:p></b></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>- nova<o:p></o:p></b></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>- horizon<o:p></o:p></b></p>

</div>

</body>

</html>



