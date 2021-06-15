# update packages
sudo apt update
sudo apt upgrade

# install necessary things
sudo apt install nodejs -y
sudo apt install npm -y
sudo apt install nginx -y
npm install -g pm2

echo "Installed packages"

# adding my desktop's SSH key
cd .ssh
echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKzn2gjOKERdwMYfxbc23KNy361TKxUbPANyXDPd1OWPXk7OD4hYskpLIofTJVjpGiMFv9ixTKiW/Yg3mmMCZYWkY66JrqQQ6nNeZmQiXVdYYej+ttQFQKCzIxISMFTyNR+lRcRdWJ7a+rMQZxZpPV8NQsqV86iwz/2h6tUw0yY1IxEzbMNa3u59o50lIcdmKjBOEne8R3c7NGu0mH78OVp4LYF+N4DqzZr31Mg8yZo4FLGcfT+Z/Y3aZlssNHVNh/u4KtTEpoOnLK3AcIQ527+rmzk0XvDlojGUkn3NGyUqEqagIKpHqujn9nx2lg/e+3XQXqQajP9+zyHReNcrfOq1YWERMyT3lsM+117Uqt34qMmRNEWyTWD0oZbJMw/IiZmLyKb9WXVvdxPz5cNhcaAZloJjfce1vZvic6BSJ4rTSiQAYLaTye1kK8/+KHgVinJiohfys+sRQYo5rnXCtUDICHlVaCN+vN9jyYAnyfxekls1Z+SMFVokqf5rxwTbk= adithya@DESKTOP-CRJNJLH >> authorized_keys

echo "Added SSH key"

# changing the default password
set password "password"

sudo passwd root
expect "New password:"
send "$password"
expect "Retype new password:"
send "$password"

echo "Changed password"

# creating a temporary server
cd ..
mkdir temp-server
cd temp-server

# creating the node application
npm init -y
npm install express
touch app.js

# writing into the app.js file
echo "const express = require('express');" >> app.js
echo "const app = express();" >> app.js
echo "app.get('/', function(req, res){ res.send('Server is running'); }); " >> app.js
echo "app.listen(3000, function(){ console.log('Server is listening on port 3000'); });" >> app.js

# starting up the server using pm2
pm2 start app.js

echo "Mock server started"

# moving into the nginx directory
cd /etc/nginx/sites-available
rm default
touch default

# replacing the contents of the default file
echo "server {" >> default
echo "listen       80;" >> default
echo "server_name adi-m.com www.adi-m.com;" >> default
echo "    location / {" >> default
echo "      proxy_pass      http://127.0.0.1:3000;" >> default
echo "    }" >> default
echo "  }" >> default

# restarting nginx server
sudo systemctl restart nginx

echo "Nginx restarted"

# creating the SSH key for GitHub
set passphrase "github-vagrant"

cd ~/.ssh
ssh-keygen -t ed25519
expect "Enter file in which to save the key (/root/.ssh/id_ed25519):"
send "github"
expect "Enter passphrase (empty for no passphrase):"
send "$passphrase"
expect "Enter same passphrase again:"
send "$passphrase"

mkdir ~/projectname

# displaying few details
echo "THE PUBLIC  KEY IS"
echo "$(cat github.pub)"

echo "THE PRIVATE KEY IS"
echo "$(cat github)"

echo "THE IP ADDRESS IS"
echo "$(curl ident.me)"