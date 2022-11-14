# secret file

You can create a vault by running

```bash
ansible-vault create --vault-password-file=vault.txt somefile
```

This opens an editor in which you can add yaml:

```yaml
ansible_sudo_pass: password123
```

To edit the file you need to open it with

```bash
ansible-vault edit --vault-password-file=vault.txt somefile
```

If you skip `--vault-password-file=vault.txt` it will prompt for the password.

With `ansible-vault` plugin in vscode you can set `ansibleVault.keyfile` to `vault.txt` in workspace settings. Then you can open the enrypted/descrypt the vars files with control+option+0 (zero).

The `vault.txt` file is a simple text file containing only the password for the vault. Here a sample:

```text
password123
```

## SSH Config

Ansible requires being able to ssh to the managed hosts.

`.ssh/config` entries for this setup.

```text
Host ubuntu01
 HostName 192.168.64.5
 User manuel
 Port 2222
Host ubuntu02
 HostName 192.168.64.6
 User manuel
 Port 2222
Host ubuntu03
 HostName 192.168.64.8
 User manuel
 Port 2222
```

If you didn't change the ssh port from 22 to 2222 before running the first time:

```text
Host ubuntu01
 HostName 192.168.64.5
 User manuel
Host ubuntu02
 HostName 192.168.64.6
 User manuel
Host ubuntu03
 HostName 192.168.64.8
 User manuel
```

The initial setup only requires a ssh-user which ansible can access with public key authentication.
So an easy test is running `ssh ubuntu01` for example. This should open a remote shell without prompt.
