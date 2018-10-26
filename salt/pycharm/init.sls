{% set pycharm_download_link = 'https://download.jetbrains.com/python/pycharm-community-2018.1.4.tar.gz' %}
{% set pycharm_dir = '/opt/pycharm-community-2018.1.4' %}
{% set pycharm_sha = '90953ca424bb331348e3575975fab4e189ab126ddc367223e3a7cb01b1563f3b' %}

pycharm:
  archive.extracted:
    - name: /opt/
    - source: {{ pycharm_download_link }}
    - source_hash: sha256={{ pycharm_sha }}
    - options: xfz
    - archive_format: tar
    - if_missing: {{ pycharm_dir }}/
    - require:
      - pkg: openjdk-11-jre
    - unless: ls -al {{ pycharm_dir }}

pycharm-symlink:
  file.symlink:
    - name: /usr/local/bin/pycharm
    - target: {{ pycharm_dir }}/bin/pycharm.sh
    - require:
      - archive: pycharm

pycharm-launcher:
  file.managed:
    - name: /usr/share/applications/pycharm.desktop
    - source: salt://pycharm/pycharm.desktop
    - template: jinja
    - context:
        pycharm_dir: {{ pycharm_dir }}