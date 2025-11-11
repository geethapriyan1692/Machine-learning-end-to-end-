#!/bin/bash

kill -9 `ps aux |grep gunicorn |grep galaxyml | awk '{ print $2 }'`
#kill -9 `ps aux |grep appd |grep galaxyml | awk '{ print $2 }'`
