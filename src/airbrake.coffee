# Description
#   A Airbrake convert to Object from JSON.
#
class Airbrake
  constructor: (@json) ->

  error_id: ->
    @json.error.id

  error_message: ->
    @json.error.error_message

  error_class: ->
    @json.error.error_class

  environment: ->
    @json.error.environment

  project_name: ->
    @json.error.project.name

  request_url: ->
    @json.error.last_notice.request_url

  project_id: ->
    @json.error.project.id

  backtraces: ->
    @json.error.last_notice.backtrace.slice(0, 3)

  url: ->
    "https://#{process.env.HUBOT_AIRBRAKE_SUBDOMAIN}.airbrake.io/projects/#{@project_id()}/groups/#{@error_id()}"

module.exports = Airbrake
