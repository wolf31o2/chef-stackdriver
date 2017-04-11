name             'stackdriver'
maintainer       'David Laube'
maintainer_email 'dave@dlaube.com'
license          'All rights reserved'
description      'Installs/Configures stackdriver'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

%w{amazon centos debian fedora redhat scientific ubuntu}.each do |os|
  supports os
end
