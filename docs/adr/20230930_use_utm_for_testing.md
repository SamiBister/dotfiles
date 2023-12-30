# Use UTM for testing

## Status

Approved

## Context

Testing and developing the script with my machine has posibility to break my
machine. I want to test the script in a safe environment.

Also i need to test the script with pristine macOS installation.

New macbooks have apple silicon. VirtualBox has challenges with that. Parellels
is working solution. However it is not free. And it is very much locked down
for more advanced use cases. UTM is free and open source. It is also very
flexible.

## Decision

Testing for the script will be done with UTM.

## Consequences

Install UTM into development machine.