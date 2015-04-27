require("blanket") {
  pattern: [
    "hubot-airbrake-notifier/src/airbrake-notifier.coffee",
    "hubot-airbrake-notifier/src/airbrake.coffee",
    "hubot-airbrake-notifier/src/message.coffee"
  ]
  loader: "./node-loaders/coffee-script"
}
