## rtmp

# Deploy to AWS

Create an EC2 - I launch a t4g.nano using Ubuntu which is arm64
Allocate an Elastic IP Address
Associate the Elastic IP Address with the EC2
SSH into the EC2
Install Docker
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

```
sudo usermod -aG docker $USER
```

Exit the EC2 and then SSH back into it

Copy `.env.example` to `.env.local`
Fill in the environment variables
The IP Address is the IP Address from where you want to stream


```
docker compose --env-file .env.local up -d --build

```


if you're on fiber, you can probably get away with just streaming from localhost no big deal
```
docker compose -f docker-compose.debug.yaml --env-file .env.local up -d --build

```