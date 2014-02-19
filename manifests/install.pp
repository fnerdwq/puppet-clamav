# install required packages (private)
class clamav::install {

  $extra_packages = ['arj', 'bzip2', 'cabextract', 'cpio', 'file',
                      'gzip', 'nomarch', 'pax', 'unzip', 'zoo', 'zip']

  ensure_resource('package', $extra_packages, { 'ensure' => 'present' })

  package { 'clamav-daemon':
    ensure => latest,
  }

}
