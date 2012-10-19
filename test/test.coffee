
# Simple test suite, just logs some commands
log = require('../index')('TEST-LOG')

log.info 'Info log'
log.debug 'Debug log'
log.error 'Error log'
