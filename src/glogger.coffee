
# Require modules
winston = require 'winston'
config = require 'config'

require 'winston-loggly'

# Load configs
loggly = config.Loggly?

if loggly
    logglySubdomain = config.Loggly.Subdomain
    logglyInputName = config.Loggly.InputName
    logglyInputToken = config.Loggly.InputToken


logger = new winston.Logger()

# Settup console logger
logger.add winston.transports.Console, (
    level: 'silly'
    colorize: true
    timestamp: true
)

# Setup loggly logger if required
if loggly
    logger.add winston.transports.Loggly, (
        subdomain: logglySubdomain
        inputName: logglyInputName
        inputToken: logglyInputToken
    )



class Log

    constructor: (@prefix) ->
        @logger = logger

    info: (msg, meta) ->
        @logger.info "#{@prefix} - #{msg}", meta

    debug: (msg, meta) ->
        @logger.debug "#{@prefix} - #{msg}", meta

    error: (msg, meta) ->
        @logger.error "#{@prefix} - #{msg}", meta


module.exports = (p) ->
    new Log p
