#!/usr/bin/ruby

require 'json'
require 'securerandom'

class Mobileconfig

  TEMPLATE_FOLDER = './templates'

  def generate_wlan(input, output)
    wlanDicts = Array.new(0)
    data = read_json input
    data['wlan'].each do |item|
      wlanDicts << wlan_dict(item)
    end
    # write and handle mobileconfig
    File.open(output, 'w') do |out|
      content = File.read("#{TEMPLATE_FOLDER}/wlan.template")
      content = replace_str(content, 'DISPLAY_NAME', data['displayName'])
      content = replace_str(content, 'DESCRIPTION', data['description'])
      content = replace_str(content, 'ORGANISATION', data['organisation'])
      content = replace_str(content, 'PROFILE_INSTALL_MESSAGE', data['installMessage'])
      content = replace_str(content, 'HOSTNAME', `hostname`.strip)
      content = replace_str(content, 'UUID', SecureRandom.uuid)
      content = replace_str(content, 'WLAN_DICTS', wlanDicts.join(' '))
      out << content
    end
  end

  def wlan_dict item
    content = File.read("#{TEMPLATE_FOLDER}/wlan-dict.template")
    content = replace_str(content, 'UUID', SecureRandom.uuid)
    content = replace_str(content, 'SSID', item['ssid'])
    content = replace_str(content, 'ENCRYPTION', item['encryption'])
    content = replace_str(content, 'PASSWORD', item['password'])
    content = replace_str(content, 'DISPLAY_NAME', item['displayName'])
    content = replace_str(content, 'DESCRIPTION', item['description'])
    return content
  end

  def read_json inputFile
    jsonFile = File.read(inputFile)
    return JSON.parse(jsonFile)
  end

  def replace_str text, search, replace
    return text.gsub('::' + search + '::', replace)
  end

end
