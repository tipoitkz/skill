># User

ansible-playbook user_create.yml --ask-pass -i inventory/static.yml --ask-vault-pass

># Postfix

### Install

ansible-playbook postfix.yml --ask-pass -i inventory/static.yml --tags "init postfix"

### Drop

ansible-playbook postfix.yml --ask-pass -i inventory/static.yml --tags "drop postfix"