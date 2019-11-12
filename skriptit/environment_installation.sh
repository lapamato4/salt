
echo "Salt installation and configuration starting..."
set -o verbose

echo "Installing Salt and Git..."
sudo apt-get update
sudo apt-get -y install git salt-minion salt-master

echo "Retrieving and Applying Settings..."
echo 'master: localhost'|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion.service
sudo salt-key -A

cd /srv
sudo git clone https://github.com/lapamato4/salt/
cd /srv/salt

echo "Installing developer tools with salt"
sudo salt '*' state.apply devkontti

echo "Salt installed and configured. Developer tools installed"
