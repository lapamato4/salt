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
