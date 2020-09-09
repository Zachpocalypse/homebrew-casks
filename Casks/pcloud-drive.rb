#!/usr/bin/env ruby

cask 'pcloud-drive' do
  version '3.9.5'
  sha256 '77287c59f899a24123ecc4c6cba3bf18fc83a9f0c938848678386b079a061813'

  url do
    require 'net/http'
    require 'json'
    api = 'https://api.pcloud.com/'
    code = 'XZAgiVXZyEWI9yCKqw8eLkjHTmOkjHiOMc5X'
    uri = URI(api + 'getpublinkdownload?code=' + code)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    data['hosts'][0] + data['path']
  end
  name 'pCloud Drive'
  homepage 'https://www.pcloud.com/'

  depends_on cask: 'osxfuse'

  pkg 'pCloud Drive 3.9.5.pkg'

  uninstall quit:    'com.pcloud.pcloud.macos',
            pkgutil: 'com.mobileinno.pkg.pCloudDrive'
end
