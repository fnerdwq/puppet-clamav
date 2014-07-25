# install backports pin (private)
class clamav::backports {

  if $clamav::backports {
    include apt::backports

    $release = downcase($::lsbdistcodename)
    # for now only the unofficial-sigs
    apt::pin { 'pin_clamav_release':
      packages => 'clamav-unofficial-sigs',
      release  => "${release}-backports",
      priority => '995',
    }

  }

}
