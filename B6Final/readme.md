### users.yml

1. Создаёт учетную запись на хосте ansible, используя команду ```ansible-playbook -i inventory/static.yml users.yml --tags local-user```
2. Вручную нужно закодировать содержимое публичного ключа созданного пользователя используя команду ```ansible-vault encrypt_string```
3. Вставить значение в переменную `pub_cert`
4. Выполнить снова ```ansible-playbook -i inventory/static.yml users.yml --ask-vault-pass --tags remote-user```

В итоге на хосте ansible создастся пользователь `{{ ans_user }}` и его ключ распространиться на все хосты в inventory. После чего можно заходить по ключу на все хосты с хоста ansible.

### docker.yml

Ставит docker 

### postgres.yml

Ставит postgresql при этом беря переменные с файла inventory.