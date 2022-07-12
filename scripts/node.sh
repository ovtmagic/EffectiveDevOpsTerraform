#!/bin/bash

apt-get update
apt-get install -y git nodejs

wget https://raw.githubusercontent.com/yogeshraheja/Effective-DevOps-with-AWS/master/Chapter02/helloworld.js -O /tmp/helloworld.js

echo "nohup node /tmp/helloworld.js & " | sudo tee /etc/init.d/hello
update-rc.d hello defaults

cat << EOF > /etc/init.d/hello
#!/bin/bash
### BEGIN INIT INFO
# Provides:          my-service-name
# Required-Start:    $all
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: your description here
### END INIT INFO

nohup node /tmp/helloworld.js & 
EOF

chmod +x /etc/init.d/hello
update-rc.d hello defaults
update-rc.d hello enable

systemctl start hello
