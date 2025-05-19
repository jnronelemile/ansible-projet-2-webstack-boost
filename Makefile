

# Automatisation du projet Ansible WebStack Boost

up:
	vagrant up

destroy:
	vagrant destroy -f

status:
	vagrant status

ssh-master:
	vagrant ssh ansible-master

init-lab:
	vagrant ssh ansible-master -c "cd /vagrant && ./setup-lab-vagrant-control-node.sh"

deploy:
	vagrant ssh ansible-master -c "cd /vagrant && ansible-playbook -i inventory site.yml"

logs:
	vagrant ssh web -c "sudo journalctl -u nginx"

.PHONY: up destroy status ssh-master init-lab deploy logs
