cd .ssh
echo "$DESKTOP_SSH" >> authorized_keys

echo "Added PC's SSH key"

# adding the SSH key for GitHub
cd ~/.ssh

echo "$GITHUB_PRIVATE_KEY" >> github

echo "$GITHUB_PUBLIC_KEY" >> github.pub

echo "ADDED THE SSH KEYS"

# update packages
sudo apt update
sudo apt upgrade

# install necessary things
sudo apt install nodejs -y
sudo apt install npm -y
sudo apt install nginx -y
npm install -g pm2

echo "Installed packages"

# moving into the nginx directory
cd /etc/nginx/sites-available
rm default
touch default

# replacing the contents of the default file
echo "server {
	listen       80;
	server_name _;
    	location / {
      		proxy_pass      http://127.0.0.1:3000;
    	}
  }" >> default

# restarting nginx server
sudo systemctl restart nginx

echo "Nginx restarted"

# modifying permissions

sudo chmod 600 ~/.ssh/github
sudo chmod 600 ~/.ssh/github.pub
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
cat github.pub >> authorized_keys

echo "PERMISSIONS CHANGED AND KEYS ADDED TO HOST"

# cloning the repo
cd ~
git clone git@github.com:Adithya2907/vagrant_test.git
cd vagrant_test
npm install
pm2 start app.js
pm2 startup
pm2 save

echo "REPO CLONE"

# displaying the IP
echo "THIS IS THE IP"
curl ifconfig.me