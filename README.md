# hubot-airbrake-notifier
[![Build Status](https://travis-ci.org/1syo/hubot-airbrake-notifier.svg?branch=master)](https://travis-ci.org/1syo/hubot-airbrake-notifier)
[![Coverage Status](https://coveralls.io/repos/1syo/hubot-airbrake-notifier/badge.png)](https://coveralls.io/r/1syo/hubot-airbrake-notifier)
[![Dependencies Status](https://david-dm.org/1syo/hubot-airbrake-notifier.png)](https://david-dm.org/1syo/hubot-airbrake-notifier)

A hubot script that notify to every time a new error occurs in Airbrake

See [`src/airbrake-notifier.coffee`](src/airbrake-notifier.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-airbrake-notifier.git --save`

Then add **hubot-airbrake-notifier** to your `external-scripts.json`:

```json
["hubot-airbrake-notifier"]
```

Set HUBOT_AIRBRAKE_SUBDOMAIN environment variable:

```
export HUBOT_AIRBRAKE_SUBDOMAIN=YOUR_SUBDOMAIN_HEARE
```

## Airbrake configuration

Configure your Airbrake webhook integration:

Url: ``<hubot host>:<hubot port>/<hubot name>/airbrake/<room>``
