# mobileconfig

Ruby script to generate easy mobileconfig's for:

- WLAN

_*.json and *.mobileconfig files are not tracked in this repository._

## install

```shell
git clone https://github.com/s7nio/mobileconfig.git
cd mobileconfig
```

## usage

1. Edit and save the ```wlan.json.default``` as ```wlan.json``` file
2. Run the script with following sample command
```shell
ruby -r "./mobileconfig.rb" -e "Mobileconfig.new.generate_wlan('wlan.json', 'WLAN-NAME-'+Time.now.strftime('%F')+'.mobileconfig')"
```
3. Import the generated ```*.mobileconfig``` file into your iOS/macOS device
