# Description
#   A hubot script that notify to every time a new error occurs in Airbrake
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_AIRBRAKE_SUBDOMAIN
#
# Commands:
#   None
#
# URLS:
#   POST /<hubot>/airbrake/<room>
#
# Notes:
#  https://help.airbrake.io/kb/integrations/webhooks
#
# Author:
#   TAKAHASHI Kazunari[takahashi@1syo.net]
#
Airbrake = require "./airbrake"
Message = require "./message"
module.exports = (robot) ->
  robot.router.post "/#{robot.name}/airbrake/:room", (req, res) ->
    try
      message = new Message(new Airbrake(req.body))
      robot.send { room: req.params.room }, message.build()

      res.end "[Airbrake] Sending message"
    catch e
      res.end "[Airbrake] #{e}"
