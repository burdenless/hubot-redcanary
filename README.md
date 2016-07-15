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
user1>> hubot rc summary 1
hubot>> Got it. Take a look:
      *Summary*​: An instance of malware was observed.
      *Hostname*: TEST
      *Username*: test\someuser
      *Link*: https://test.my.redcanary.co/detections/1
      *Indicators*: Count[0] https://test.my.redcanary.co/openapi/v2/detections/1/indicators
```
