#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}/.." || exit 1

echo "running from $(pwd)"
ansible-playbook -i hosts.yml --vault-password-file=vault.txt playbooks/p_ubuntuhosts_init.yml