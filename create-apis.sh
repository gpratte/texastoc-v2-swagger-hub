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
            "annualTocAmount":340,
            "buyIn":680,
            "date":"2018-06-02",
            "doubleBuyIn":false,
            "hostId":4,
            "hostName":"Brian Baker",
            "id":1,
            "numPlayers":2,
            "payouts":[
               {
                  "amount":100,
                  "place":1
               },
               {
                  "amount":85,
                  "place":2
               }
            ],
            "players":[
               {
                  "annualToc":10,
                  "buyIn":30,
                  "chop":null,
                  "id":4,
                  "name":"Brian Baker",
                  "place":1,
                  "playerId":0,
                  "points":124,
                  "quarterlyToc":10,
                  "reBuy":20
               },
               {
                  "annualToc":null,
                  "buyIn":30,
                  "chop":null,
                  "id":5,
                  "name":"John Hiatt",
                  "place":null,
                  "playerId":0,
                  "points":null,
                  "quarterlyToc":null,
                  "reBuy":null
               }
            ],
            "quarterlyOrdinal":1,
            "quarterlyTocAmount":120,
            "rebuyAddOn":200,
            "seasonOrdinal":1,
            "start":"16:15:36.81"
         }
      ],
      "headers":{
         "Content-Type":"application/json"
      }
   }
}'

# See all apis
curl http://$HOST/__admin/
