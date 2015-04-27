# Description
#   A Message build message using Mustache.
#
Mustache = require 'mustache'

class Message
  constructor: (@airbrake) ->

  template: ->
    process.env.HUBOT_AIRBRAKE_TEMPLATE ||
      'New exception for {{ project_name }} ({{ environment }}): {{ error_class }} ({{{ url }}})'

  build: ->
    Mustache.render(@template(), @airbrake)

module.exports = Message
