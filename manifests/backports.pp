# install backports pin (private)
class clamav::backports {

  if $clamav::backports {
    include apt::backports

    $release = downcase($::lsbdistcodename)
    apt::pin { 'pin_clamav_release':
      packages => 'clamav-* libclamav*',
      release  => "${release}-backports",
      priority => '995',
    }

  }

}
