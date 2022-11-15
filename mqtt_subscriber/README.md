## Mosquitto MQTT Subscriber Example (Sample 3)   
### Start MQTT Broker:   

On localhost machine run mqtt broker   
```
cd mqtt
docker-compose up -d
```
### Run

Set in einit/src/init.yaml.in your local ip address and 18883 port (it forwarded via Docker) (for me its 10.5.20.23)...   
You can check it with  
```
ip a
```
If you`re linux user :)   

Run docker image with:
```
docker run -it --rm --volume $(pwd):/workspace --privileged kos:latest bash   
```

Build n run subscriber:   

```
./cross-build.sh   
/opt/KasperskyOS-Community-Edition-1.1.0.356/toolchain/bin/qemu-system-aarch64 -m 2048 -machine vexpress-a15,secure=on -cpu cortex-a72 -nographic -monitor none -smp 4 -net nic -net user -serial stdio -kernel build/einit/kos-qemu-image   
```

After app launched you should see that client connected and subscribed [ScreenShot](/screens/1.png "Connected screen")   

### Spam into broker   

Client subscribed on `my/awesome/topic`... Let's spam there a bit.   

Run from your local machine `./mosquitto-spamer.sh` (require mosquitto_pub: apt-get install -y mosquitto-clients)   

You should see something as [ScreenShot2](/screens/2.png "Spam screen")   
