sh run.sh "{'podNetworkCidr':'10.100.0.1/16','serviceCidr':'10.96.0.0/12','master':{'in_ip':'172.21.28.226','ip':'161.117.248.84','port':22,'user':'root','pass':'password'},'nodes':[{'in_ip':'172.21.28.225','ip':'161.117.249.248','port':22,'user':'root','pass':'password'},{'in_ip':'172.21.28.224','ip':'161.117.251.225','port':22,'user':'root','pass':'password'}]}"


json格式说明
{
	"podNetworkCidr": "10.100.0.1/16",
	"serviceCidr": "10.96.0.0/12",
	"master": {
		"in_ip": "172.21.28.226", #内网ip
		"ip": "161.117.248.84",   #外网ip
		"port": 22,               #端口
		"user": "root",           #用户名
		"pass": "password"    #密码
	},
	"nodes": [{
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