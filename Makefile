Q=$(if $V,,@)

default: all

all:
	ansible-playbook -i inventories/workhorse/inventory -b -u root nas.yml

dashy:
	ansible-playbook -i inventories/workhorse/inventory --tags "dashy" -b -u root nas.yml
	ansible all -a "docker restart dashy" -i inventories/workhorse/inventory -b -u root

mysql:
	ansible-playbook -i inventories/workhorse/inventory --tags "mysql" -b -u root nas.yml

nocodb:
	ansible-playbook -i inventories/workhorse/inventory --tags "nocodb" -b -u root nas.yml

gitea:
	ansible-playbook -i inventories/workhorse/inventory --tags "gitea" -b -u root nas.yml

wg:
	ansible-playbook -i inventories/workhorse/inventory --tags "wireguard" -b -u root nas.yml
