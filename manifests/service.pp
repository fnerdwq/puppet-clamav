# managing the clamav and freshclam service (private)
class clamav::service {

  service {'clamav-daemon':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  service {'clamav-freshclam':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
