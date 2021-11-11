# High Performance Molecular Dynamics

## Logging into CINECA's computer systems

To logon to the M100 system use the following command from an SSH client
```bash
ssh username@login.m100.cineca.it
```
where **username** will be provided by the demonstrators.

Note also that the demonstrators will also provide you with a computing budget to use called an "account".
This has already been inserted in the example scripts.

## Downloading the tutorial files

To download and use the example files for the tutorials use the following command after having logged in:

```bash
git clone https://gitlab.hpc.cineca.it/training/molecular-dynamics.git
cd molecular-dynamics
```

Each tutorial will have its own directory name, for example:
```bash
cd essential-dynamics
```

The demonstrators will from time-to-time update the tutorial or upload solutions to problems. To see the updates
use the following git command:
```bash
git pull
```

In case of problems contact a demonstrator.

