# configuring clamav (private)
class clamav::config {

  if $clamav::addgroup {
    $allow_supplementary_groups = true

    $user_additional_groups = any2array($clamav::addgroup)
  } else {
    $allow_supplementary_groups = false

    $user_additional_groups = []
  }

  # neede to have cron update for unofficial sigs running
  if $clamav::clamav_unofficial_sigs {
    $user_shell = '/bin/bash'
  } else {
    $user_shell = '/bin/false'
  }


  user {'clamav':
    groups => $user_additional_groups,
    home   => $clamav::database_directory,
    shell  => $user_shell,
  }

  file {'/etc/clamav/clamd.conf':
    ensure  => present,
    content => template('clamav/clamd.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

}
