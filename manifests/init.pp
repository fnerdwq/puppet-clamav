# == Class: clamav
#
# This installs and configures clamav/freshclam.
#
# This works on Debian.
# Puppet Version >= 3.4.0
#
# === Parameters
#
# [*addgroup*]
#   To which group should the clamav user be added (e.g. amavisd)
#   *Optional* (defaults to undef)
#
# [*database_directory*]
#   Where the signatures are kept.
#   *Optional* (defaults to /var/lib/clamav)
#
# [*init_freshclam*]
#   If freshclam should be initiall run to download signatures.
#   *Optional* (defaults to true)
#
# [*clamav_unofficial_sigs*]
#   Install the unofficial sigs?
#   *Optional* (defaults to false)
#
# [*backports*]
#   Install and pin from Debian Backports?
#   *Optional* (defaults to false)
#
# === Examples
#
# include clamav
#
# === Authors
#
# Frederik Wagner <wagner@wagit.de>
#
# === Copyright
#
# Copyright 2014 Frederik Wagner
#
class clamav (
  $addgroup               = undef,
  $database_directory     = '/var/lib/clamav',
  $init_freshclam         = true,
  $clamav_unofficial_sigs = false,
  $backports              = false,
) {

  validate_bool(str2bool($init_freshclam))
  validate_bool(str2bool($clamav_unofficial_sigs))
  validate_bool(str2bool($backports))

  contain clamav::backports
  contain clamav::freshclam::install
  contain clamav::freshclam::config
  contain clamav::freshclam::update
  contain clamav::install
  contain clamav::config
  contain clamav::service

  Class['clamav::backports']
  -> Class['clamav::freshclam::install']
  -> Class['clamav::freshclam::config']
  ~> Class['clamav::freshclam::update']
  -> Class['clamav::install']
  -> Class['clamav::config']
  ~> Class['clamav::service']


}
