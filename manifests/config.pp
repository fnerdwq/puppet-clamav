# configuring clamav (private)
class clamav::config {

  if $clamav::addgroup {
    $allow_supplementary_groups = true

    user {'clamav':
      groups => any2array($clamav::addgroup)
    }

  } else {
    $allow_supplementary_groups = false
  }

  file {'/etc/clamav/clamd.conf':
    ensure  => present,
    content => template('clamav/clamd.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

}
