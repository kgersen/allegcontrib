deny.dll is an ISAPI filter tested in IIS5.0

Add it under WWW master or Web properties using 
the Internet Services Manager - ISAPI Filters tab.

A deny.ips file is read in from C:\InetPub directory.
Also, it can easily support a database, let me know if
this needs changing.

This filter will make it harder (not impossible) for people
to connect to ASGS via. HTTP proxies.  It will, however, 
considerably cut down on the number of IP's you have to
manualy ban (and give you an easy way to do it).

There are only so many high-anonymity non-RFC compliant
open proxies out there ;-)

--Imago <imago@marinms.com>