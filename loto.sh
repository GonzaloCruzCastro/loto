#!/bin/bash
sorteo=$(curl 'https://www.polla.cl/es/view/home' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, br' \
	-H 'Accept-Language: es-419,es;q=0.8' -H 'Upgrade-Insecure-Requests: 1' \
	-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36' \
	-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://www.polla.cl/es/view/resultados/5271'\
	-H 'Cookie: language=es; edge_production=ros9kscr06d5m001qmiasevnm0; _gat_Tracker_0=1; _ga=GA1.2.55454081.1505061238; _gid=GA1.2.2066918335.1505754238' \
	-H 'Connection: keep-alive' -H 'Cache-Control: no-cache' --compressed -s | grep -o "DrawNumber......" | sed -n 1p | cut -c13-17) \

curl 'https://www.polla.cl/es/get/draw/results' -H 'Host: www.polla.cl' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0' \
	-H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Content-Type: application/json; charset=utf-8' \
	-H 'X-Requested-With: XMLHttpRequest' -H 'Referer: https://www.polla.cl/es/view/resultados/5271' \
	-H 'Cookie: language=es; _ga=GA1.2.1505211117.1494111000; _gid=GA1.2.727506341.1505077549; edge_production=td3r0s2d3g3sv811lhpus41874; _gat_Tracker_0=1' \
	-H 'Connection: keep-alive' --data '{"gameId":"5271","drawId":'$sorteo'}' -s | python -c 'import sys,json;data=json.loads(sys.stdin.read()); print "LOTO",data["drawNumber"],data["drawDateString"],"-> ",data["results"][0]["number"],data["results"][1]["number"],data["results"][2]["number"],data["results"][3]["number"],data["results"][4]["number"],data["results"][5]["number"],"|",data["results"][6]["number"]' 


