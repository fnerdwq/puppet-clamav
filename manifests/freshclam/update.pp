# download signatures initially (private)
class clamav::freshclam::update {

  # initially update signatuers, otherwise clamav-daemon doesn't start
  if $clamav::init_freshclam {

    exec { 'freshclam update':
      command     => 'freshclam --quiet',
      timeout     => 600,
      refreshonly => true,
      path        => ['/usr/bin'],
    }

  }

}
