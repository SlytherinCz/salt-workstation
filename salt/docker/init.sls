{% set docker_compose_path = '/usr/local/bin/docker-compose' %}

docker:
  cmd.script:
    - source: https://get.docker.com
    - require:
      - file: docker-config
    - shell: /bin/bash

docker-config:
  file.append:
    - name: /etc/default/docker
    - text: |
        DOCKER_OPTS="--bip={{ pillar['docker']['bip'] }}"

docker-compose:
  file.managed:
    - name: {{ docker_compose_path }}
    - source: https://github.com/docker/compose/releases/download/1.21.2/docker-compose-Linux-x86_64
    - skip_verify: True
    - mode: 755
    - unless: ls -al {{ docker_compose_path }}
