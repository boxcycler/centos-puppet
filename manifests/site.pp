#-------------------------------------------------------------------------------
# project name:  Systems Administration
# file name:     site.pp
# author:        Steve Vasta
# created:       February 21, 2017
# modified:      May 24, 2018
# description:   Puppet nodes definition file for new builds . . .

#-------------------------------------------------------------------------------
# create a new run stage to ensure certain modules are included first
stage { 'pre':
  before => Stage['main']
}

#-------------------------------------------------------------------------------
# add the baseconfig module to the new 'pre' run stage
class { 'baseconfig':
  stage => 'pre'
}

#-------------------------------------------------------------------------------
# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}

#-------------------------------------------------------------------------------
# all boxes get the base config

node 'default' {
  include baseconfig
}
