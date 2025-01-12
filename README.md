# mantisbt

Type of Database:																	PostgreSQL
Hostname (for Database Server)										mantisdb
Username (for Database)														postgres
Password (for Database)														YourSecurePostgresPassword
Database name (for Database)											mantisbt
Admin Username (to create Database if required) 	postgres
Admin Password (to create Database if required) 	YourSecurePostgresPassword

The credentials to log in to Mantis are administrator:root
Make yourself a user and change the administrator password

Use ssh tunneling to access the database with pgadmin

Connection:
  Host name/address:     mantisdb
  Port:                  5432
  Maintenance database:  postgres
  Username:              postgres
  Password:              YourSecurePostgresPassword

SSH Tunnel:
  Tunnel host:           192.168.1.1
  Tunnel port:           222
  Username:              tunnel
  Authentication:        Identity file
  Identity file:         /srv/mantisbt/ssh/mantis_ed25519
  Password:              YourSecureSSHPassword