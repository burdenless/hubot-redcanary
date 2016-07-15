# hubot-redcanary

Basic interaction with the RedCanary portal

See [`src/redcanary.coffee`](src/redcanary.coffee) for full documentation.

## Installation

In the hubot project repo, run:

`npm install hubot-redcanary --save`

Then add **hubot-redcanary** to your `external-scripts.json`:

```json
["hubot-redcanary"]
```

Set your environment variables needed to contact the RedCanary portal

```
RC_TOKEN=<api-token>
RC_PORTAL=<portalname>
```
* Your RC_PORTAL variable will be the subdomain customized for your environment. e.g. If your access URL is test.my.redcanary.co, your RC_PORTAL variable would be:
```test```

## Sample Interaction

```
user1>> hubot rc count detections
hubot>> Current detection count: 800
hubot>> Wow.. You might be pwnd
```
