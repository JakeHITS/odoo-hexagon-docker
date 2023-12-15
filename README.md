# odoo-hexagon-docker

To run this docker container, run the following two commands:
```
docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=odoo --name db postgres
```
```
docker run -it -d -p 8069:8069 -p 8071:8071 -p 8072:8072 --name odoo --link db:db jakeknow17/odoo-hexagon-dev:17.0 /bin/bash
```

To attach to the Odoo container, run the following command:
```
docker attach odoo
```

You can find the Docker repository [here](https://hub.docker.com/r/jakeknow17/odoo-hexagon-dev).

## Dependencies

Once inside the `/odoo-dev` directory, make sure to clone the [`odoo/enterprise`](https://github.com/odoo/enterprise) repository as well as clone this repository when inside the odoo-dev/hits-apps folder.

## Running Odoo
To run Odoo once inside the docker container, run the following command:
```
/odoo-dev/run-odoo.sh
```

## Github

If you have any issues authenticating your Github account within the docker container, install the [Github CLI](https://github.com/cli/cli)

Then, you can authenticate by running the following command:
```
gh auth login
```
