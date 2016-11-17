Certbot Renew Hook Mailer
=========================

This little script, when passed as renew hook to certbot renew, sends an
email informing about the renewed domains. It is rather primitive but gets
the job done.

Please take this as it is, a quick hack to get informed on renewals.

Tested on CentOS 7.

Installation
------------
1. Copy certbot-newcerts.sh somewhere, e.g. /usr/local/bin.
2. Update the recipient and possibly sender 
3. Add the script as renew hook, for an example see certbot-renew.cron which
   would then be copied to /etc/cron.daily (and renamed to certbot-renew)
   for daily execution.

Note for CentOS 7 users
-----------------------
Make sure that the cron job is working, especially look at SELinux messages.
For me, using the Apache authentication method, I had to do:
    chcon -R -t httpd_sys_rw_content_t /var/lib/letsencrypt/

Additionally, note that mailx, or more precisely the ssmtp library, does not
allow for custom setting of the sender name. If you want to use something
other than what the cronjob is running as, like the certbot@hostname as
suggested in the hook script, edit `/etc/ssmtp/ssmtp.conf` and set
    FromLineOverride=YES

Aachen, 2016/11/17
Tim Niemueller
