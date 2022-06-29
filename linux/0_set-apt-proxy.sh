### before you run this script, make it executable: chmod +x 0_set-apt-proxy.sh

### if you're at work and 'sudo apt update' fails, you might need to configure a proxy for http(s) traffic
### replace the following URLs to point to your proxy

cd /etc/apt/apt.conf.d
sudo touch 80proxy
sudo echo 'Acquire::http::proxy "http://proxy.example.com:8080/";' >> 80proxy
sudo echo 'Acquire::https::proxy "https://proxy.example.com:8080/";' >> 80proxy
