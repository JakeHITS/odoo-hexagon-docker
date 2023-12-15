#!/bin/bash

CMD="/odoo-dev/odoo/odoo-bin --addons-path=/odoo-dev/odoo/addons,/odoo-dev/enterprise,/odoo-dev/hits-apps --db_host db --db_port 5432 --db_user odoo --db_password odoo -d odoo"

if ! [ -f /odoo-dev/.ran_odoo ]
then
    touch /odoo-dev/.ran_odoo
    CMD += " -i base"
fi

$CMD
