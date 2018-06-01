#!/bin/bash

# Set the host
HOST=api-texastoc.herokuapp.com

# Reset the apis
curl -X POST http://$HOST/__admin/reset

# Create a new game
curl -X POST http://$HOST/__admin/mappings -d '
{
   "request":{
      "method":"POST",
      "url":"/v2/games"
   },
   "response":{
      "jsonBody":{
         "id":"1"
      },
      "headers":{
         "Content-Type":"application/json"
      }
   }
}'

# Get the games for a season
curl -X POST http://$HOST/__admin/mappings -d '
{
   "request":{
      "method":"GET",
      "urlPathPattern": "/v2/games/season/([0-9]+)"
   },
   "response":{
      "jsonBody":{
         "id":"1"
      },
      "headers":{
         "Content-Type":"application/json"
      }
   }
}'

# See all apis
curl http://$HOST/__admin/
