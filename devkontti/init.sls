applications:
  pkg.installed:
    - pkgs:
      - docker.io
      - docker-compose
      - python3
      - git

/etc/docker/daemon.json:
  file.managed:
    - source: salt://devkontti/insecure_conf.json

dockerservice:
  service.running:
    - name: docker
    - reload: True
    - watch:
      - file: /etc/docker/daemon.json
