slack:
  pkg.installed:
    - name: slack-desktop
    - sources:
      - slack: https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb
    - unless: dpkg -l slack-desktop | grep 3.2.1
    - update: true
