# Description
#   Interact with the Red Canary threat portal
#
# Dependencies:
#   None
#
# Configuration:
#   RC_TOKEN
#
# Commands:
#   hubot rc count sensors - Fetches sensor count
#   hubot rc count detections - Fetches detection count
#   hubot rc ioc <detectionId> - Retrieve IOC's for the given detection id
#   hubot rc host <detectionId> - Get hostname for detection id
#   hubot rc summary <detectionId> - Get summary for detection id
#
# Notes:
#   Basic interactions with the RedCanary portal
#
# Author:
#   @byt3smith (Bobby Argenbright)

API = process.env.RC_TOKEN

module.exports = (robot) ->

  robot.respond /rc get sensors/i, (msg) ->
    msg.emote "Getting sensor counts!"

  robot.respond /rc get events/i, (msg) ->
    msg.send "Getting events!"
