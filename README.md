```
sh run.sh "{'podNetworkCidr':'10.100.0.1/16','serviceCidr':'10.96.0.0/12','master':{'in_ip':'172.21.28.226','ip':'161.117.248.84','port':22,'user':'root','pass':'password'},'nodes':[{'in_ip':'172.21.28.225','ip':'161.117.249.248','port':22,'user':'root','pass':'password'},{'in_ip':'172.21.28.224','ip':'161.117.251.225','port':22,'user':'root','pass':'password'}]}"
```

```
{
	"podNetworkCidr": "10.100.0.1/16", #k8s network setting
	"serviceCidr": "10.96.0.0/12",     #k8s network setting
	"master": {                        #master
		"in_ip": "172.21.28.226",      #lan ip 
		"ip": "161.117.248.84",        #internet ip 
		"port": 22,                    #ssh port
		"user": "root",                #ssh username
		"pass": "password"             #ssh password
	},
	"nodes": [{                        #node
			"in_ip": "172.21.28.225",
			"ip": "161.117.249.248",
			"port": 22,
			"user": "root",
			"pass": "password"
		},
		{
			"in_ip": "172.21.28.224",
			"ip": "161.117.251.225",
			"port": 22,
			"user": "root",
			"pass": "password"
		}
	]
}
```