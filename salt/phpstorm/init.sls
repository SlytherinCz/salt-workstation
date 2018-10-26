{% set phpstorm_download_link = 'https://download.jetbrains.com/webide/PhpStorm-2018.1.6.tar.gz' %}
{% set phpstorm_dir = '/opt/PhpStorm-181.5281.35' %}
{% set phpstorm_sha = 'b64dd079630d144bf8bb77943a78bf4cc351cec8f08bb2b8995c717f9ed3076c' %}

phpstorm:
  archive.extracted:
    - name: /opt/
    - source: {{ phpstorm_download_link }}
    - source_hash: sha256={{ phpstorm_sha }}
    - options: xfz
    - archive_format: tar
    - if_missing: {{ phpstorm_dir }}/
    - require:
      - pkg: openjdk-11-jre
    - unless: ls -al {{ phpstorm_dir }}

phpstorm-symlink:
  file.symlink:
    - name: /usr/local/bin/phpstorm
    - target: {{ phpstorm_dir }}/bin/phpstorm.sh
    - require:
      - archive: phpstorm

phpstorm-launcher:
  file.managed:
    - name: /usr/share/applications/PhpStorm.desktop
    - source: salt://phpstorm/phpstorm.desktop
    - template: jinja
    - context:
        phpstorm_dir: {{ phpstorm_dir }}