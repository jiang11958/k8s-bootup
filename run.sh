#!/bin/bash
DIRNAME=$0
if [ "${DIRNAME:0:1}" = "/" ];then
    CURDIR=`dirname $DIRNAME`
else
    CURDIR="`pwd`"/"`dirname $DIRNAME`"
fi
echo $CURDIR

export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_INVENTORY="ansible/inventory/hosts"
export K8S_VERSION="1.17.4"



function installPkg(){
	echo "=====install ansible begin====="
	yum -y install ansible
	
	pip uninstall urllib3 -y
	pip uninstall chardet -y
	pip install requests
	pip install --upgrade pip
	echo "=====install ansible end====="
}

function startK8s(){
	
	echo "# init hosts"
	ansible-playbook $CURDIR/ansible/init.yaml -e $1

	echo "# install docker"
	ansible-playbook -i $ANSIBLE_INVENTORY $CURDIR/ansible/installDocker.yaml
										   
	echo "# install kubeadm"               
	ansible-playbook -i $ANSIBLE_INVENTORY -e version=${K8S_VERSION} $CURDIR/ansible/installKubernetes.yaml
										   
	echo "# bootstrap cluster"             
	ansible-playbook -i $ANSIBLE_INVENTORY -e version=${K8S_VERSION} $CURDIR/ansible/bootstrapCluster.yaml

	#echo "# Configure local client"
	#ansible-playbook -i $ANSIBLE_INVENTORY --private-key $PRIVATE_KEY ansible/configureClient.yaml
	
}

#Print the usage message
function printHelp () {
  echo "Usage: "
  echo "   sh run.sh \"{\\\"podNetworkCidr\\\":\\\"10.100.0.1/16\\\",\\\"serviceCidr\\\":\\\"10.96.0.0/16\\\",\\\"master\\\":{\\\"in_ip\\\":\\\"1.1.1.1\\\",\\\"ip\\\":\\\"1.1.1.1\\\",\\\"port\\\":22,\\\"user\\\":\\\"jeo\\\",\\\"pass\\\":\\\"123456\\\"},\\\"node\\\":[{\\\"in_ip\\\":\\\"1.1.1.1\\\",\\\"ip\\\":\\\"1.1.1.2\\\",\\\"port\\\":22,\\\"user\\\":\\\"jeo2\\\",\\\"pass\\\":\\\"123456\\\"},{\\\"in_ip\\\":\\\"1.1.1.1\\\",\\\"ip\\\":\\\"1.1.1.3\\\",\\\"port\\\":22,\\\"user\\\":\\\"jeo3\\\",\\\"pass\\\":\\\"123456\\\"}]}\""
}

if [ $# -ne 1 ];
then
	printHelp
	exit
fi

installPkg 
startK8s $1