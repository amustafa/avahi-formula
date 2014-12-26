avahi
=====

Install and manage the avahi system. You can completely configure the service, set up hosts, and create services.

Note: Only for for Ubuntu at the moment!

avahi
-----

Installs avahi. It can also optionally install bonjour compatability and python wrappers.


  bonjour-compatible: True
  
  include-python-wrappers: True


avahi.config
-----

Configures the avahi system using a pillar.

avahi.services
-----

Adds services to the /etc/avahi/services folder
