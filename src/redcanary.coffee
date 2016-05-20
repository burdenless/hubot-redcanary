# Description
#   Interact with the Red Canary threat portal
#
# Dependencies:
#   None
#
# Configuration:
#   RC_TOKEN
#   RC_PORTAL
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
PORTAL = process.env.RC_PORTAL

module.exports = (robot) ->
  # Get detection summary for detectionId
  robot.respond /rc summary (.*)/i, (msg) ->
    detection = msg.match[1]
    msg.http("https://#{PORTAL}.my.redcanary.co/openapi/v2/detections/#{detection}.json?auth_token=#{API}")
    .headers('Content-Type': 'application/json')
    .get() (err, res, body) ->
      if res.statusCode is 200
        data = JSON.parse(body)
        msg.send "Got it :+1: Take a look :eyes:\n
        *Summary*: #{data['summary']}\n
        *Hostname*: #{data['endpoint']['hostname']}\n
        *Username*: #{data['user']['username']}\n
        *Link*: #{data['link']}\n
        *Indicators*: Count[#{data['indicators']['count']}] #{data['indicators']['url']}"
      else
        msg.send "[:x:] :fire: Status Code => #{res.statusCode}"

  robot.respond /rc ioc (.*)/i, (msg) ->
    detection = msg.match[1]
    msg.http("https://#{PORTAL}.my.redcanary.co/openapi/v2/detections/#{detection}/indicators.json?auth_token=#{API}")
    .headers('Content-Type': 'application/json')
    .get() (err, res, body) ->
      if res.statusCode is 200
        data = JSON.parse(body)
        msg.send ":white_check_mark: Indicators related to detection #{detection}:"
        message = ''
        for i in data
          type = "#{i.type}"
          message += "*Type*: #{type}\n"
          if type == "Process"
            message += "*MD5*: #{i.md5}\n"
            message += "*Path*: #{i.path}\n"
          else if type == "NetworkConnection"
            message += "*IP*: #{i.ip}\n"
            message += "*Domain*: #{i.domain}\n"

          message += "*Associated Detections*: #{i.associated_detections}\n"
          message += "*Link*: #{i.url}\n"
          msg.send "#{message}"
      else
        msg.send "[:x:] :lightning: Status Code => #{res.statusCode}"
