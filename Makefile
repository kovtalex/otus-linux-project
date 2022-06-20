.PHONY: deploy_all

deploy_all: deploy-vm provision

deploy-vm:
	vagrant up --no-provision

destroy-vm:
	vagrant destroy -f

provision:
	vagrant provision app

provision-bootstrap:
	ANSIBLE_ARGS='--tags="bootstrap"' vagrant provision app

provision-app:
	ANSIBLE_ARGS='--tags="app"' vagrant provision app

provision-database:
	ANSIBLE_ARGS='--tags="database"' vagrant provision database

provision-replica:
	ANSIBLE_ARGS='--tags="replica"' vagrant provision replica

provision-backup:
	ANSIBLE_ARGS='--tags="backup"' vagrant provision backup

provision-logging:
	ANSIBLE_ARGS='--tags="logging"' vagrant provision logging

provision-monitoring:
	ANSIBLE_ARGS='--tags="monitoring"' vagrant provision monitoring

provision-fw:
	ANSIBLE_ARGS='--tags="fw"' vagrant provision fw

switchover:
	ANSIBLE_ARGS='--tags="app,switchover" --extra-vars="current_database_host=replica"' vagrant provision app	
