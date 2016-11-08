# mobileconfig

Ruby script to generate easy mobileconfig's

- WLAN

## install

```shell
git clone https://github.com/s7nio/mobileconfig.git
cd mobileconfig
```

## usage

1. Edit and save the ```wlan.json``` file
2. Run the script e.g.
```shell
ruby -r "./mobileconfig.rb" -e "Mobileconfig.new.generate_wlan('wlan.json', 'WLAN-NAME-'+Time.now.strftime('%F')+'.mobileconfig')"
```
3. Import the generated ```*.mobileconfig``` file into your iOS/macOS device
