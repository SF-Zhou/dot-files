sudo apt -y install git vim-gtk xcape proxychains xclip tsocks
sudo apt -y install libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
sudo apt -y install supervisor polipo
sudo apt -y install python3-opencv

sudo mkdir -p /etc/supervisor/conf.d
sudo cp ./supervisor/*.conf /etc/supervisor/conf.d
sudo cp ./etc_config/proxychains.conf /etc/
sudo unzip ./etc_config/shadow_config.zip -d /etc/
