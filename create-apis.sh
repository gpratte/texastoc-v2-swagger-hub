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
      "urlPathPattern":"/v2/games/season/([0-9]+)"
   },
   "response":{
      "jsonBody":[
         {
            "id":0,
            "date":"string",
            "started":"string",
            "host":"string",
            "seasonOrdinal":0,
            "quarterlyOrdinal":0,
            "numPlayers":0,
            "doubleBuyIn":true,
            "buyIn":0,
            "rebuyAddOn":0,
            "annualTocAmount":0,
            "quarterlyTocAmount":0,
            "players":[
               {
                  "playerId":0,
                  "name":"string",
                  "place":0,
                  "points":0,
                  "buyIn":0,
                  "reBuy":0,
                  "annualToc":0,
                  "quarterlyToc":0,
                  "chop":0
               }
            ],
            "payouts":[
               {
                  "place":0,
                  "amount":0
               }
            ]
         }
      ],
      "headers":{
         "Content-Type":"application/json"
      }
   }
}'

# See all apis
curl http://$HOST/__admin/
