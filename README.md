# Quick start
This repository can help you to get started with Kaspa.

Follow the instructions below to create and run docker instances of the following services.
- [Kaspad](https://github.com/kaspanet/kaspad) (Kaspa full node)
- [Kasparov](https://github.com/kaspanet/kasparov) (API server for Kaspa)
- RabbitMQ
- MYSQL

Note that Kaspad will connect to the Kaspa Testnet using the current configuration.
## Getting started
### Prerequisites
- Git
- Docker
- Docker Compose
### Cloning The GitHub Repository
Use git to clone the quick-start repository:
```
$ git clone --recurse-submodules https://github.com/meanjs/mean.git meanjs
```
### Run
(build docker images and run)
```
$ cd quick-start
$ ./run.sh
```
See `./run.sh --help` for more options.
