#puppet-clamav

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What clamav affects](#what-clamav-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with clamav](#beginning-with-clamav)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [TODOs](#todos)

##Overview

This small clamav module installs and configures clamavd and freshclam.

Written for Puppet >= 3.4.0.

##Module Description

See [Overview](#overview) for now.

##Setup

###What clamav affects

* Installs clamavd and freshclam.
* Manages the services.
* Initially downloads clamav signatures (needed to start clamav service!), this can take a while!

###Setup Requirements

Nothings special.
	
###Beginning with clamav	

Simply include it. You might want to put your amavis user to **addgroup**.

##Usage

Just include the module by 

```puppet
include clamav
```

##Limitations:

Tested only on 
* Debian 7
so far.

Puppet Version >= 3.4.0, due to specific hiera/*contain* usage.

##TODOs:

* Make it work on RedHat like systems.
* Make mor configurable.
* ... suggestions? Open an issue on github...
