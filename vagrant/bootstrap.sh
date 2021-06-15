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

echo "Added PC's SSH key"

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

# adding the SSH key for GitHub
cd ~/.ssh

echo "-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----" >> github

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBvzuztQ317vDL2+ZgnmKnGEZu7O3BDuXcsv4sThAe9UcVg5IZ7FLPGlJt7isj1bvyBgiDRhnDJcRJoAZoTbCj+0fkQiScL+pgvE6+3LzUua1Gd9x2f/hTM7iQgmp8XER2ZVj8HkmY6tJTQFwG63iALWXDWnITJPpUa9PwIFWVo8bhFaG/B6kYotIVYOvaOCRJVLLCS9oaS3sHI4ukG6xMcCxFAvg/avoy5n0a5H1BBS3ml5yImmqjM+JyuGVcgSRyTAr6bbhC95/0WW6p6PyhdoZKfH30ZSaFYUk8P58OTU3PDZZgL+olXw24W8IWqtDDKp3iLV+IhZHI3T/T0MpPbhx07RBtkvdra8WYdD+h81iL7ao4Km27sP39KRg9mPVFzlW3ZWzmTxC1QQAjepBN3xlomG1yLr+27urQOEwjrcomUnyXSyjijGWX7kI2eYIPxcuyrtcBkkQo5k3WTDOi7gfh3McKsxYXWTwYmZWZ7/N6ru+xEi5mWf5+yNA84tE= adithya@adithya-ubuntu" >> github.pub

echo "ADDED THE SSH KEYS"

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