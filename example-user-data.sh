#! /bin/bash

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

S3_BUCKET=""

sudo yum update -y
sudo yum upgrade python*

mkdir -p /etc/systemd/system/docker.service.d
cat > /etc/systemd/system/docker.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376
EOF

sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

sudo yum install jq -y
sudo yum groupinstall -y "Development Tools"
sudo yum install -y python-pip

sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo amazon-linux-extras enable nginx1
sudo yum clean metadata
sudo yum install -y nginx

sudo amazon-linux-extras install epel -y
sudo pip install crytography
sudo yum install certbot-nginx -y

sudo aws s3 cp s3://$S3_BUCKET/nginx/nginx.conf /etc/nginx/nginx.conf --sse AES256
aws s3 cp s3://$S3_BUCKET/docker/docker-compose.yml /home/ec2-user/docker-compose.yml --sse AES256

cd /home/ec2-user
docker-compose up -d

sudo aws s3 cp s3://$S3_BUCKET/ssl/fullchain.pem /etc/letsencrypt/live/gatekeeper/fullchain.pem --sse AES256
sudo aws s3 cp s3://$S3_BUCKET/ssl/privkey.pem /etc/letsencrypt/live/gatekeeper/privkey.pem --sse AES256
sudo aws s3 cp s3://$S3_BUCKET/ssl/options-ssl-nginx.conf /etc/letsencrypt/options-ssl-nginx.conf --sse AES256
sudo aws s3 cp s3://$S3_BUCKET/ssl/ssl-dhparams.pem /etc/letsencrypt/ssl-dhparams.pem --sse AES256

sudo mkdir -p /var/log/nginx/gatekeeper
sudo touch /var/log/nginx/gatekeeper/access.log
sudo touch /var/log/nginx/gatekeeper/error.log

sudo mkdir -p /etc/letsencrypt/live/gatekeeper/

sudo systemctl enable nginx.service
sudo systemctl start nginx.service
