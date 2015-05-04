chai = require 'chai'
expect = chai.expect
sinon = require 'sinon'
sandbox = sinon.sandbox.create()

json = require './fixtures/valid.json'
Airbrake = require '../src/airbrake'

describe 'Airbrake', ->
  beforeEach ->
    process.env.HUBOT_AIRBRAKE_SUBDOMAIN ||= ''
    sandbox.stub(process.env, "HUBOT_AIRBRAKE_SUBDOMAIN", "test")

    req = { body: json }
    @airbrake = new Airbrake(req.body)

  afterEach ->
    sandbox.restore()

  it '#error_id', ->
    expect(@airbrake.error_id()).to.eq 37463546

  it '#error_class', ->
    expect(@airbrake.error_class()).to.eq 'RuntimeError'

  it '#environment', ->
    expect(@airbrake.environment()).to.eq 'production'

  it '#project_name', ->
    expect(@airbrake.project_name()).to.eq 'Airbrake'

  it '#request_url', ->
    expect(@airbrake.request_url()).to.eq 'http://airbrake.io:445/pages/exception_test'

  it '#project_id', ->
    expect(@airbrake.project_id()).to.eq 1055

  it '#notice_id', ->
    expect(@airbrake.notice_id()).to.eq 4505303522

  it '#url', ->
    expect(@airbrake.url()).to.eq """
      https://test.airbrake.io/projects/1055/groups/37463546/notices/4505303522
    """
