# configuring freshclam (private)
class clamav::freshclam::config {

  if $clamav::addgroup {
    $allow_supplementary_groups = true
  } else {
    $allow_supplementary_groups = false
  }

  File {
  }

  file {'/etc/clamav/freshclam.conf':
    ensure  => present,
    content => template('clamav/freshclam.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

}
