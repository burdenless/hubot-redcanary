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

## Sample Interaction

```
user1>> hubot rc count detections
hubot>> Current detection count: 800
hubot>> Wow.. You might be pwnd
```
