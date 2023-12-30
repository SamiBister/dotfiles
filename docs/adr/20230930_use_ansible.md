# I use ansible for provisioning my machine

## Status

Accepted

## Context

I want to use Ansible for provisioning my machine. Anisble is industry
 standard for provisioning. It is operating system agnostic. It does not
 install anything on the target machine. It is idempotent.

## Decision

I will use Ansible for provisioning my machine.

I need to be careful with sensitive data. I will use Ansible Vault for
that.

## Consequences

I need to do all changes to machine with Ansible. This will take some
time, but reverting problems will be easy.