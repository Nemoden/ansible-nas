Q=$(if $V,,@)

default: all

all:
	ansible-playbook -i inventories/workhorse/inventory -b -u root nas.yml

deps:
	ansible-galaxy install -r requirements.yml

check:
	ansible-playbook --check --diff -i inventories/workhorse/inventory -b -u root nas.yml

workhorse.check:
	ansible-playbook --check --diff -i inventories/workhorse/inventory --tags "mysql,gitea,calibre,calibreweb,wireguard,jellyfin,jellyfinsys,samba,traefik,youtubedlmaterial,transmission,stats,portainer,miniflux,glances,dashy,homepage,paperless_ng,mealie,wallabag" -b -u root nas.yml

paperless.check:
	ansible-playbook --check --diff --tags "paperless_ng" nas.yml

paperless:
	ansible-playbook --tags "paperless_ng" nas.yml

homepage.check:
	ansible-playbook --check --diff --tags "homepage" nas.yml

homepage:
	ansible-playbook --tags "homepage" nas.yml

samba.check:
	ansible-playbook --check --diff --tags "samba" nas.yml

samba:
	ansible-playbook --tags "samba" nas.yml

transmission.check:
	ansible-playbook --check --diff --tags "transmission" nas.yml

transmission:
	ansible-playbook --tags "transmission" nas.yml

traefik:
	ansible-playbook --tags "traefik" nas.yml

immich-kirill.check:
	ansible-playbook --check --diff --tags "immich-kirill" nas.yml

immich-kirill:
	ansible-playbook --tags "immich-kirill" nas.yml

calibre.check:
	ansible-playbook --check --diff -i inventories/workhorse/inventory --tags "calibre,calibreweb" -b -u root nas.yml

calibre:
	ansible-playbook -i inventories/workhorse/inventory --tags "calibre,calibreweb" -b -u root nas.yml

mealie.check:
	ansible-playbook --check --diff -i inventories/workhorse/inventory --tags "mealie" -b -u root nas.yml

mealie:
	ansible-playbook -i inventories/workhorse/inventory --tags "mealie" -b -u root nas.yml

wallabag.check:
	ansible-playbook --check --diff -i inventories/workhorse/inventory --tags "wallabag" -b -u root nas.yml

wallabag:
	ansible-playbook -i inventories/workhorse/inventory --tags "wallabag" -b -u root nas.yml

dashy:
	ansible-playbook -i inventories/workhorse/inventory --tags "dashy" -b -u root nas.yml
	ansible all -a "docker restart dashy" -i inventories/workhorse/inventory -b -u root

mysql:
	ansible-playbook -i inventories/workhorse/inventory --tags "mysql" -b -u root nas.yml

nocodb:
	ansible-playbook -i inventories/workhorse/inventory --tags "nocodb" -b -u root nas.yml

gitea:
	ansible-playbook -i inventories/workhorse/inventory --tags "gitea" -b -u root nas.yml

gitea.check:
	ansible-playbook -i inventories/workhorse/inventory --syntax-check --tags "gitea" -b -u root nas.yml
	ansible-playbook -i inventories/workhorse/inventory --check --diff --tags "gitea" -b -u root nas.yml

wg:
	ansible-playbook -i inventories/workhorse/inventory --tags "wireguard" -b -u root nas.yml

wg.check:
	ansible-playbook --check --diff -i inventories/workhorse/inventory --tags "wireguard" -b -u root nas.yml

rss:
	ansible-playbook -i inventories/workhorse/inventory --tags "miniflux" -b -u root nas.yml

workspace:
	ansible-playbook -i inventories/workhorse/inventory --tags "workspace" -b -u root nas.yml

workspace.check:
	ansible-playbook -i inventories/workhorse/inventory --check --tags "workspace" -b -u root nas.yml

valkey:
	ansible-playbook --tags "valkey" nas.yml

valkey.check:
	ansible-playbook --check --tags "valkey" nas.yml

jellyfin:
	ansible-playbook -i inventories/workhorse/inventory --tags "jellyfin" -b -u root nas.yml

ci.check:
	ansible-playbook --check --tags "woodpecker_ci" nas.yml

ci:
	ansible-playbook --tags "woodpecker_ci" nas.yml

ssh-key.check:
	ansible-playbook --check --tags "ssh-key" nas.yml

ssh-key:
	ansible-playbook --tags "ssh-key" nas.yml
