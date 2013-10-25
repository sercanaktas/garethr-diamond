# == Class: diamond
#
# A basic module to manage diamond, stats collection daemon for Graphite
#
# === Parameters
# [*version*]
#   The package version to install
#
# [*enable*]
#   Should the service be enabled during boot time?
#
# [*start*]
#   Should the service be started by Puppet
#
# [*interval*]
#   How often should metrics be collected and sent to Graphite
#
# [*graphite_host*]
#   Where to find the graphite server
#
# [*graphite_handler*]
#   Which handler to use to talk with graphite server
#
# [*librato_user*]
#   Your Librato username
#
# [*librato_apikey*]
#   Your Librato apikey
#
# [*riemann_host*]
#   Where to find the riemann server
#
# [*path_prefix*]
#   Define optional path_prefix for storing metrics
#
# [*path_suffix*]
#   Define optional path_suffix for storing metrics
#
class diamond(
  $version          = 'present',
  $enable           = true,
  $start            = true,
  $interval         = 30,
  $librato_user     = false,
  $librato_apikey   = false,
  $graphite_host    = false,
  $graphite_handler = 'graphite.GraphiteHandler',
  $riemann_host     = false,
  $path_prefix      = undef,
  $path_suffix      = undef,
) {
  class{'diamond::install': } ->
  class{'diamond::config': } ~>
  class{'diamond::service': } ->
  Class['diamond']
}
