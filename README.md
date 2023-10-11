# odoo-hexagon-docker

To run this docker container, run the following two commands:
```bash
docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=odoo --name db postgres
docker run -it -p 8069:8069 -p 8071:8071 -p 8072:8072 --name odoo --link db:db odoo-hexagon-dev:16.0 /bin/bash
```
