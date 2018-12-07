/tmp/createuser.sql:
  file.managed:
    - source: salt://dbcrea/createuser.sql

'cat /tmp/createuser.sql|mariadb -u root':
  cmd.run:
    - unless: "echo 'show databases'|sudo mariadb -u root|grep '^hats$'"
