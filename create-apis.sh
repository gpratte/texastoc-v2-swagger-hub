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
      "url":"/api/v2/games"
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
      "urlPathPattern":"/api/v2/games/season/([0-9]+)"
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

# Get the current game
curl -X POST http://$HOST/__admin/mappings -d '
{
   "request":{
      "method":"GET",
      "url":"/api/v2/games/current"
   },
   "response":{
      "jsonBody":{
         "annualTocAmount":340,
         "buyIn":680,
         "clockId":3,
         "date":"2018-06-02",
         "doubleBuyIn":false,
         "hostId":4,
         "hostName":"Brian Baker",
         "id":1,
         "kitty":10,
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
         "start":"18:55:44.737",
         "tables":[
            {
               "number":1,
               "seats":[
                  {
                     "gamePlayerId":3,
                     "gamePlayerName":"Joey Baloney",
                     "number":1
                  },
                  {
                     "gamePlayerId":5,
                     "gamePlayerName":"Bob your uncle",
                     "number":2
                  }
               ]
            }
         ],
         "transportRequired":true
      },
      "headers":{
         "Content-Type":"application/json"
      }
   }
}'

# Update a game
curl -X POST http://$HOST/__admin/mappings -d '
{
   "request":{
      "method":"PUT",
      "url":"/api/v2/games/current"
   },
   "response":{
   }
}'

# Get all the players that are not in the game
curl -X POST http://$HOST/__admin/mappings -d '
{
   "request":{
      "method":"GET",
      "url":"/api/v2/games/current/players?included=false"
   },
   "response":{
      "jsonBody":[
         {
            "cell":null,
            "email":null,
            "id":1,
            "name":"Brian Baker"
         },
         {
            "cell":null,
            "email":null,
            "id":2,
            "name":"John Hiatt"
         }
      ],
      "headers":{
         "Content-Type":"application/json"
      }
   }
}'

# Do not support getting players that are in the game
curl -X POST http://$HOST/__admin/mappings -d '
{
   "request":{
      "method":"GET",
      "url":"/api/v2/games/current/players?included=true"
   },
   "response":{
      "status":400,
      "jsonBody":{
         "status":"Error",
         "message":"included=true not supported"
      },
      "headers":{
         "Content-Type":"application/json"
      }
   }
}'

# Add a player to the current game
curl -X POST http://$HOST/__admin/mappings -d '
{
   "request":{
      "method":"POST",
      "url":"/api/v2/games/current/players"
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

# Update a player in the current game
curl -X POST http://$HOST/__admin/mappings -d '
{
   "request":{
      "method":"PUT",
      "url":"/api/v2/games/current/players"
   },
   "response":{
   }
}'

# Seat players at tables
curl -X POST http://$HOST/__admin/mappings -d '
{
   "request":{
      "method":"POST",
      "url":"/api/v2/games/current/seating"
   },
   "response":{
      "jsonBody":[
         {
            "number":1,
            "seats":[
               {
                  "gamePlayerId":3,
                  "gamePlayerName":"Joey Baloney",
                  "number":1
               },
               {
                  "gamePlayerId":5,
                  "gamePlayerName":"Bob your uncle",
                  "number":2
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
