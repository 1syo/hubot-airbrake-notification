chai = require 'chai'
expect = chai.expect
sinon = require 'sinon'
sandbox = sinon.sandbox.create()

Message = require '../src/message'
Airbrake = require '../src/airbrake'
json = require './fixtures/valid.json'

describe 'Message', ->
  beforeEach ->
    process.env.HUBOT_AIRBRAKE_TEMPLATE ||= ''

  describe 'exists HUBOT_AIRBRAKE_TEMPLATE', ->
    beforeEach ->
      sandbox.stub(process.env, "HUBOT_AIRBRAKE_TEMPLATE", 'Exception {{ project_name }}: {{ error_class }}')
      @message = new Message(new Airbrake(json))

    afterEach ->
      sandbox.restore()

    it '#build', ->
      expect(@message.build()).to.eq "Exception Airbrake: RuntimeError"

  describe 'not exists HUBOT_AIRBRAKE_TEMPLATE', ->
    beforeEach ->
      @message = new Message(new Airbrake(json))

    it '#build', ->
      message = 'New exception for Airbrake (production): RuntimeError (https://.airbrake.io/projects/1055/groups/37463546)'
      expect(@message.build()).to.eq message
