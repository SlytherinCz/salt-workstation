{% set intellijidea_download_link = 'https://download.jetbrains.com/idea/ideaIC-2018.1.6.tar.gz' %}
{% set intellijidea_dir = '/opt/idea-IC-181.5540.7' %}
{% set intellijidea_sha = 'ca7c746a26bc58c6c87c34e33fbba6f767f2df9dca34eb688e3c07a126cdc393' %}

intellijidea:
  archive.extracted:
    - name: /opt/
    - source: {{ intellijidea_download_link }}
    - source_hash: sha256={{ intellijidea_sha }}
    - options: xfz
    - archive_format: tar
    - if_missing: {{ intellijidea_dir }}/
    - require:
      - pkg: openjdk-11-jre
    - unless: ls -al {{ intellijidea_dir }}

intellijidea-symlink:
  file.symlink:
    - name: /usr/local/bin/idea
    - target: {{ intellijidea_dir }}/bin/idea.sh
    - require:
      - archive: intellijidea

intellijidea-launcher:
  file.managed:
    - name: /usr/share/applications/intellijidea.desktop
    - source: salt://intellijidea/intellijidea.desktop
    - template: jinja
    - context:
        intellijidea_dir: {{ intellijidea_dir }}