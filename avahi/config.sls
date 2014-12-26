{%- from "avahi/map.jinja" import avahi with context %}

include:
 - avahi

avahi-configuration:
  file.managed:
    - name: {{ avahi.get("conf_path") }}
    - source: {{ avahi.get("conf_src") }}
    - template: jinja
    - watch_in:
      - service: avahi-daemon

avahi-hosts:
  file.managed:
    - name: {{ avahi.get("hosts_path") }}
    - source: {{ avahi.get("host_template") }}
    - template: jinja
    - watch_in:
      - service: avahi-daemon