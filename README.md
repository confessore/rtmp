## rtmp

# Deploy to AWS

1. Create an EC2 - I launch a t4g.nano using Ubuntu which is arm64
2. Allocate an Elastic IP Address
3. Associate the Elastic IP Address with the EC2
4. Ensure that port 1935 is open
5. SSH into the EC2
6. Install Docker
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

7. Exit the EC2 and then SSH back into it

8. Copy `.env.example` to `.env.local`
9. Fill in the environment variables
    - The IP Address is the IP Address from where you want to stream
10. Start the server

```
docker compose --env-file .env.local up -d --build

```
11. Stream to `rtmp://<your-ip-or-domain>:1935/live/obs_stream`


if you're on fiber, you can probably get away with just streaming to localhost no big deal
```
docker compose -f docker-compose.debug.yaml --env-file .env.local up -d --build

```
