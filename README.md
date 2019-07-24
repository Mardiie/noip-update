https://hub.docker.com/r/freedox/noip-update

About:

This is a simple script to keep your No-IP.com Dynamic DNS hosts up to date. \
What this does is:

1. Check if you variables are set except for NOIP_INTERVAL since this has been set at 5 minutes by default.
2. It uses curl to update the given No-IP host-name.
3. It sleeps for the given interval and then starts at step 2 again.

Run with Docker:

````
$ docker run -d \
	-e NOIP_USER=<Your No-IP username or email> \
	-e NOIP_PASSWORD=<Your No-IP password> \
	-e NOIP_HOST=<Your No-IP host-name you want to update> \
	-e NOIP_INTERVAL=<The update interval (default: 5 minutes)> \
	-v /etc/timezone:/etc/timezone:ro \
	-v /etc/localtime:/etc/localtime:ro \
	freedox/noip-update:latest
````

You can also download the script file and modify it yourself then run outside of Docker. \
The only dependencies required are: curl and sleep (most Linux distros have these preinstalled)
