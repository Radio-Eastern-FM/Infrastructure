# Station Infrastructure

This repository contains docker files that automatically build and deploy the internal station infrastructure for Radio Eastern


## Instructions

## Install

### Prerequisites

* Docker
* git

1. Install docker
2. Clone repository using git `git clone https://github.com/Radio-Eastern-FM/Infrastructure.git`
3. CD to "Infrastructure": `cd ./Infrastructure`
4. Run docker daemon (depends on OS version; see https://docs.docker.com/config/daemon/)
5. Build & run (see below)

### Build

Build all services: `docker-compose build`
Build specific service: `docker-compose build <service>` e.g. `docker-compose build observer`

### Run

Run all services: `docker-compose up`

Run a specific service: `docker-compose up <service>` e.g. `docker-compose up observer`

### Stop

`docker-compose down`
