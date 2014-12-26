{%- from "avahi/map.jinja" import avahi with context %}
{%- set bonjour_compat = avahi.get('avahi:bonjour-compatible') %}
{%- set include_python_wrappers = avahi.get('avahi:include-python-wrappers') %}


avahi-daemon:
    pkg.installed:
      - name: {{ avahi.get('package') }}
    service.running:
      - name: {{ avahi.get('proc_name') }}
      - enable: True
      - require:
        - pkg: avahi-daemon


{%- if bonjour_compat %}
bonjour-compatability:
  pkg.installed:
    - pkgs:
{%- for b_pkg in avahi.get('bonjour-compatability-packages') %}
      - {{ b_pkg }}
{%- endfor %}
    - require:
      - pkg: avahi-daemon
{%- endif %}


{%- if include_python_wrappers %}
python-requirements:
  pkg.installed:
    - pkgs:
{%- for python_package in avahi.get('python-wrapper-packages') %}
      {{ python_package }}
{%- endfor %}{%- endif %}

