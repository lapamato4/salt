applications:
  pkg.installed:
    - pkgs:
      - docker.io
      - docker-compose
      - python3
      - git

/etc/docker/daemon.json:
  file.managed:
    - source: salt://devkontti/conf_files/insecure_conf.json

/bin/getimages:
  file.managed:
    - source: salt://devkontti/conf_files/getimages
    - group: users
    - mode: 755

dockerservice:
  service.running:
    - name: docker
    - reload: True
    - watch:
      - file: /etc/docker/daemon.json
