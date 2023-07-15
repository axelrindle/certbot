[![CI](https://github.com/axelrindle/certbot/actions/workflows/ci.yml/badge.svg)](https://github.com/axelrindle/certbot/actions/workflows/ci.yml)

# certbot

This is the certbot configuration I'm using.

It relies on the manual plugin.

## Supported challenges

- HTTP-01
- Manual DNS via [lima-city](https://www.lima-city.de/)

## Setup

### 1. Clone this repository

```shell
git clone https://github.com/axelrindle/certbot.git
cd certbot
```

### 2. Create and activate a virtual environment:

```shell
python3 -m venv venv
source venv/bin/activate
```

### 3. Install the dependencies

```shell
pip install -r requirements.txt
```

### 4. Define common variables

Configure all challenges you requested certificates with.

E.g if all of your certificates were requesting using the DNS-01 challenge,
you may only configure the DNS challenge.

```shell
cp hooks/$CHALLENGE/common.sh.example hooks/$CHALLENGE/common.sh
```

The variables are required for copying the auth token via SSH to the webroot.

Activate the virtual environment whenever you want to work
with your certificates.

### 5. (optional) create a deployment script

If you want to copy your certificates to another (local or remote) location
afterwards, create a file named `deploy.sh` and fill it with logic. It will
be called after a successful renewal.

## Requesting a certificate
 
Run the following command to obtain a new certificate:

```shell
certbot certonly \
    --manual \
    --preferred-challenges http \
    -d <DOMAIN>
```

## Automatic renewal

The `certbot.sh` script can be used in cron for automatic renewal.

## TODO

- Certificate requesting
