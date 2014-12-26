{%- from "avahi/map.jinja" import avahi with context %}
{%- set avahi_services = avahi.get('services', {}) %}

include:
 - avahi
 - avahi.config

avahi-services-directory:
  file.directory:
    - name: {{ avahi.get("services_path") }}
    - dir_mode: 755
    - file_mode: 755
    - require:
      - pkg: avahi-daemon
    - watch_in:
      - service: avahi-daemon


# Create a service file for every subsection in "avahi:services"
{%- for service_name in avahi_services.keys() %}
service-creater-{{ service_name }}:
  file.managed:
    - name: {{ salt['file.join']( avahi.get("services_path"), '%s.service' % service_name) }}
    - source: {{ avahi.get('service_template') }}
    - user: root
    - group: root
    - mode: 755
    - template: jinja
    - context:
        avahi_service_in_progress: {{ service_name }}
{% endfor %}
