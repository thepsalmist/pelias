# South Africa

This project is configured to download/prepare/build a complete Pelias installation for South Africa.

# Setup

Please refer to the instructions at https://github.com/pelias/docker in order to install and configure your docker environment.

The minimum configuration required in order to run this project are [installing prerequisites](https://github.com/pelias/docker#prerequisites), [install the pelias command](https://github.com/pelias/docker#installing-the-pelias-command) and [configure the environment](https://github.com/pelias/docker#configure-environment).

Please ensure that's all working fine before continuing.

# Run a Build

To run a complete build, execute the following commands:

```bash
pelias compose pull
pelias elastic start
pelias elastic wait
pelias elastic create
pelias download all
pelias prepare all
pelias import all
pelias compose up
```

# Make an Example Query

You can now make queries against your new Pelias build:

Forward Geocoding

    http://localhost:4000/v1/search?text=El-Gomhoreya Square, Rahbet Abdin, Abdeen, Cairo Governorate, Egypt

Reverse Geocoding

    http://localhost:4000/v1/reverse?point.lon=30.043244015517843&point.lat=31.25082177662669
