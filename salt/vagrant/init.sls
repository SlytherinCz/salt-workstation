vagrant:
  pkg.installed:
    - name: vagrant
    - sources:
      - vagrant: https://releases.hashicorp.com/vagrant/2.0.4/vagrant_2.0.4_x86_64.deb
    - unless: dpkg -l vagrant | grep 1:2.0.4
