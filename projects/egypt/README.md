# Egypt

This project is configured to download/prepare/build a complete Pelias installation for Egypt.

# Prerequisites

Docker installed - [install docker ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)

Docker Compose - [install docker compose ](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)

# Setup

Please refer to the instructions at https://github.com/pelias/docker in order to install and configure your docker environment.

The minimum configuration required in order to run this project are [installing prerequisites](https://github.com/pelias/docker#prerequisites), [install the pelias command](https://github.com/pelias/docker#installing-the-pelias-command) and [configure the environment](https://github.com/pelias/docker#configure-environment).

Please ensure that's all working fine before continuing.

# Run a Build

To run a complete build, execute the following commands:

```bash
sudo chmod +x pelias.sh

./pelias.sh
```

# Test API endponints

You can now make queries against your new Pelias build:

Forward Geocoding http://localhost:4000/v1/search?text=900 park street, tshwane, south africa

Reverse Geocoding
