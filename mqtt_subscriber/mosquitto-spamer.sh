#!/bin/bash

mosquitto_pub -h localhost -p 18883 -t 'my/awesome/topic' -m 'bebebebebebe'
mosquitto_pub -h localhost -p 18883 -t 'my/awesome/topic' -m 'basbbsbbsbbe'
mosquitto_pub -h localhost -p 18883 -t 'my/awesome/topic' -m 'Helloooooooo'
mosquitto_pub -h localhost -p 18883 -t 'my/awesome/topic' -m '       World'
