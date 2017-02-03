#!/bin/ash

# generate host keys if not present
ssh-keygen -A

if [ -f "/root/.ssh/authorized_keys" ]; then
    chown -R root:root /root/.ssh
    chmod 700 /root/.ssh
    chmod 600 /root/.ssh/authorized_keys
fi

# detach, log to stderr (-e), passthrough other arguments
/usr/sbin/sshd -e

if [ $# -gt 0 ]; then
    /usr/bin/rsync --daemon
    exec "$@"
else
    exec /usr/bin/rsync --no-detach --daemon "$@"
fi
