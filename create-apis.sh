#!/bin/bash

# Set the host
HOST=api-texastoc.herokuapp.com

# Create the apis in wiremock running in heroku
curl -X POST http://$HOST/__admin/mappings -d '{ "request": { "method": "POST", "url": "/v2/games" }, "response": { "jsonBody": {"id": "1" }, "headers": {"Content-Type": "application/json"}}}'

# See all apis
curl http://$HOST/__admin/

