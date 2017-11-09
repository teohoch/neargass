#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	DO \$\$
	BEGIN
		IF NOT EXISTS (SELECT FROM   pg_catalog.pg_user WHERE  usename = 'Bencinera') THEN
			CREATE USER "Bencinera" SUPERUSER PASSWORD '$BENCINERA_DATABASE_PASSWORD';
		END IF;
	END
	\$\$
EOSQL
