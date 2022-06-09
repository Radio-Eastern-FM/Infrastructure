# Station Infrastructure

This repository contains docker files that automatically build and deploy the internal station infrastructure for Radio Eastern

## Prerequisites

* Docker

## Instructions

### Build

Build all services: `docker-compose build`
Build specific service: `docker-compose build <service>` e.g. `docker-compose build observer`

### Run

Run all services: `docker-compose up`

Run a specific service: `docker-compose up <service>` e.g. `docker-compose up observer`

### Stop

`docker-compose down`
