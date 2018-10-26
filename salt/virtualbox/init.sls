virtualbox-ppa-key:
  cmd.run:
    - name: wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | apt-key add -
    - unless: apt-key finger | grep 'B9F8 D658 297A F3EF C18D  5CDF A2F6 83C5 2980 AECF'

virtualbox-ppa:
  pkgrepo.managed:
    - hummanname: Virtualbox Repository
    - name: deb http://download.virtualbox.org/virtualbox/debian {{ pillar['system']['os'] }} contrib
    - dist: {{ pillar['system']['os'] }}
    - file: /etc/apt/sources.list.d/virtualbox.list

virtualbox:
  pkg.installed:
    - name: virtualbox-5.1
    - require:
      - cmd: virtualbox-ppa-key
      - pkgrepo: virtualbox-ppa