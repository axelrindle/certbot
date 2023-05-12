# certbot

This is the certbot configuration I'm using.

It relies on the manual plugin.

## Setup

1. Clone this repository

```shell
git clone https://github.com/axelrindle/certbot.git
cd certbot
```

2. Create and activate a virtual environment:

```shell
python3 -m venv venv
source venv/bin/activate
```

3. Install the dependencies

```shell
pip install -r requirements.txt
```

Activate the virtual environment whenever you want to work
with your certificates.

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
