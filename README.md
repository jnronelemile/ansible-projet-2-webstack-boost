
# Mini-Projet 2 : Ansible Web stack Boost

## ✅ Objectifs du projet

Projet Ansible de niveau intermédiaire (~6/10) pour déployer un environnement web sécurisé avec Vagrant, Ansible et NGINX.

- 🧑‍💼 Créer un utilisateur `deploy` avec accès SSH via clé publique
- 🌐 Installer `nginx` avec une configuration dynamique via template Jinja2
- 🔥 Configurer le pare-feu `UFW` avec ouverture des ports 22, 80 et 443
- ⚙️ Appliquer des `handlers` uniquement si le fichier nginx.conf est modifié
- 🏷️ Utiliser des `tags` pour exécuter un rôle spécifique à la demande
- 🧠 Séparer les environnements `dev` et `prod` via `group_vars`
- 🧪 Garantir une exécution idempotente à chaque déploiement



## Composants

- `Vagrant` : pour simuler l'infrastructure (ansible-master + web)
- `Ansible` : pour le provisionnement automatisé
- `NGINX` : comme serveur web
- `UFW` : pare-feu avec ports contrôlés
- `deploy` : utilisateur système pour connexion SSH propre
- `group_vars` : pour gérer des configurations dynamiques


## Structure du projet

```mackdown
ansible-2-webstack-boost/
├── group_vars
│   ├── prod.yml
│   └── web.yml
├── inventory
├── README.md
├── roles
│   ├── firewall
│   │   └── tasks
│   │       └── main.yml
│   ├── user
│   │   └── tasks
│   │       └── main.yml
│   └── web
│       ├── files
│       │   └── index.html
│       ├── handlers
│       │   └── main.yml
│       ├── tasks
│       │   └── main.yml
│       └── templates
│           └── nginx.conf.j2
├── setup-lab-vagrant-control-node.sh
├── site.yml
└── Vagrantfile
```

## Lancer le projet

**Démarrer les machines :**

```bash
vagrant up
```
**Configurer le noeud Ansible**

```bash
vagrant ssh ansible-master

cd ansible-2-webstack-boost/

./setup-lab-vagrant-control-node.sh
```
**Exécuter le playbook Ansible :**
```bash
ansible-playbook -i inventory site.yml
```

## Résultat attendu

- Serveur web opérationnel sur http://192.168.56.11

- Page HTML déployée automatiquement

- Pare-feu actif, ports autorisés dynamiquement

- Connexion SSH possible en tant que deploy

## Clé SSH

La variable deploy_ssh_key est chargée automatiquement depuis :
```yml
deploy_ssh_key: "{{ lookup('file', lookup('env','HOME') + '/.ssh/deploy_key.pub') }}"
```
