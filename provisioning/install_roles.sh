#!/bin/bash

ansible-galaxy install --roles-path $(pwd)/roles git+https://github.com/geerlingguy/ansible-role-kibana.git
ansible-galaxy install --roles-path $(pwd)/roles git+https://github.com/elastic/ansible-elasticsearch.git
ansible-galaxy install --roles-path $(pwd)/roles git+https://github.com/nginxinc/ansible-role-nginx.git
ansible-galaxy install --roles-path $(pwd)/roles git+https://github.com/nginxinc/ansible-role-nginx-config.git
