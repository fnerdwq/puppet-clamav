# install required packages for freshclam (private)
class clamav::freshclam::install {

  package { 'clamav-freshclam':
    ensure => latest,
  }

}
