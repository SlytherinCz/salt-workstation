{% set node_dir = '/opt/node-v10.7.0-linux-x64/' %}

node:
  archive.extracted:
    - name: /opt/
    - source: https://nodejs.org/dist/v10.7.0/node-v10.7.0-linux-x64.tar.xz
    - skip_verify: True
    - mode: 755
    - unless: ls -al {{ node_dir }}

node-symlink:
  file.symlink:
    - name: /usr/local/bin/node
    - target: {{ node_dir }}/bin/node
    - require:
      - archive: node

npm-symlink:
  file.symlink:
    - name: /usr/local/bin/npm
    - target: {{ node_dir }}/bin/npm
    - require:
      - archive: node
