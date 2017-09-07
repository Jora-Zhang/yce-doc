#! /bin/bash

checkError() {
    if [ $1 != 0 ]
    then
        echo -e "......\t\tError"
#        exit -1
    else
        echo -e "......\t\tOK"
    fi
}

ORGID="1"
USERID="7"
SESSIONID="7d3b67eb-acb4-4929-816d-5318f04e6fed"

grep "iris.API" ../../../src/app/backend/common/yce/router/router.go | cut -d '"' -f2 > apis
echo `wc -l apis` need to test
echo ORGID=$ORGID
echo USERID=$USERID
echo SESSIONID=$SESSIONID

# login
echo -e "----------------------------------\n Testing /api/v1/users/login"
result=`curl -sXPOST -d "{\"username\":\"liyao.miao\", \"password\":\"123456\"}" localhost:8080/api/v1/users/login`
status=`echo $result | grep "code" | cut -d ':' -f2 | cut -d ',' -f1`
checkError $status
SESSIONID=`echo $result | grep "sessionId" | cut -d ':' -f5 | cut -d ',' -f1 | cut -d '"' -f2 | cut -d '\' -f1`
echo SESSIONID=$SESSIONID

testApi() {
    echo -e "----------------------------------\n
    Testing $1"
    URL="localhost:8080$1"
    URL=`echo $URL | sed "s#:orgId#$ORGID#g"`
    URL=`echo $URL | sed "s#:userId#$USERID#g"`
    URL=`echo $URL | sed "s#:deploymentName#$4#g"`
    URL=`echo $URL | sed "s#:podName#$4#g"`
    URL=`echo $URL | sed "s#:svcName#$4#g"`
    URL=`echo $URL | sed "s#:epName#$4#g"`
    URL=`echo $URL | sed "s#:dcId#$5#g"`
    echo $URL
    if [ $2 == "GET" ]
    then
        echo startAt:
        date
        result=`curl -sX$2 -H "Authorization":$SESSIONID $URL`
        echo stopAt:
        date
        status=`echo $result | grep "code" | cut -d ':' -f2 | cut -d ',' -f1`
        checkError $status
    fi
    if [ $2 == "POST" ]
    then
        echo startAt:
        date
        result=`curl -sX$2 -H "Authorization":$SESSIONID -d "${3}" $URL`
        echo stopAt:
        date
        echo $result
        status=`echo $result | grep "code" | cut -d ':' -f2 | cut -d ',' -f1`
        checkError $status
    fi
}

# navList
testApi `grep -w 3 apisnum | cut -d ' ' -f2` GET

# deployments init
testApi `grep -w 5 apisnum | cut -d ' ' -f2` GET

# deployment check
testApi `grep -w 7 apisnum | cut -d ' ' -f2` POST "{\"name\":\"testdeployment\"}"

# deployments new
testApi `grep -w 6 apisnum | cut -d ' ' -f2` POST "{\"appName\": \"testdeployment\",\"orgName\": \"dev\",\"dcIdList\": [1],\"deployment\": {\"kind\": \"Deployment\",\"apiVersion\": \"extensions/v1beta1\",\"metadata\": {\"name\": \"testdeployment\",\"namespace\": \"dev\",\"labels\": {\"name\": \"testdeployment\",\"version\": \"testversion\",\"author\": \"liyao.miao\"}},\"spec\": {\"replicas\": 2,\"template\": {\"metadata\": {\"labels\": {\"name\": \"testdeployment\",\"version\": \"testversion\",\"author\": \"liyao.miao\"}},\"spec\": {\"volumes\": [{\"name\": \"testvolumes\",\"hostPath\": {\"path\": \"/test\"}}],\"containers\": [{\"name\": \"testdeployment\",\"resources\": {\"limits\": {\"cpu\": \"1000m\",\"memory\": \"2000M\"}},\"image\": \"img.reg.3g:15000/nginx:1.7.9\",\"env\": [{\"name\": \"testenv\",\"value\": \"testvalue\"}],\"ports\": [{\"name\": \"testports\",\"containerPort\": 8080,\"protocol\": \"TCP\"}],\"command\": [\"ls\"],\"args\": [\"-a\"],\"livenessProbe\": {\"httpGet\": {\"path\": \"/healthz\",\"port\": 8080},\"periodSeconds\": 10,\"initialDelaySeconds\": 30},\"volumeMounts\": [{\"name\": \"testvolumes\",\"mountPath\": \"/test\",\"readOnly\": true}],\"lifecycle\": {\"postStart\": {\"exec\": {\"command\": [\"ls\"]}},\"preStop\": {\"exec\": {\"command\": [\"ls\"]}}}}]}}}}}"

# deployments
testApi `grep -w 4 apisnum | cut -d ' ' -f2` GET

# deployment rolling
testApi `grep -w 8 apisnum | cut -d ' ' -f2` POST "{\"appName\":\"testdeployment\", \"dcIdList\":[1], \"orgName\":\"dev\", \"userId\":\"7\", \"strategy\": {\"image\":\"img.reg.3g:1500/nginx:1.9.7\"}, \"comments\": \"test updating\"}" testdeployment

# deployment rollback
testApi `grep -w 9 apisnum | cut -d ' ' -f2` POST "{\"appName\": \"testdeployment\", \"dcIdList\": [1], \"userId\": \"7\", \"image\":\"img.reg.3g:15000/nginx:1.7.9\", \"revision\":\"1\", \"comments\": \"test rollback\"}" testdeployment

# deployment scale
testApi `grep -w 10 apisnum | cut -d ' ' -f2` POST "{\"newSize\":1, \"dcIdList\": [1], \"userId\":7, \"comments\":\"test scale\"}" testdeployment

PODNAME=`ssh root@master kubectl get pods --namespace=dev | grep testdeployment | cut -d ' ' -f1 | head -1`
echo $PODNAME

# deployment logs
testApi `grep -w 12 apisnum | cut -d ' ' -f2` POST "{\"userId\":\"7\", \"dcIdList\":[1], \"logOption\":{\"container\":\"\", \"follow\":false, \"previous\":false, \"sinceSeconds\":0, \"sinceTime\":null, \"timeStamps\":true, \"tailLines\":100, \"limitBytes\":0}}" $PODNAME

# deployment respawn
testApi `grep -w 14 apisnum | cut -d ' ' -f2` POST "{\"op\":\"7\", \"dcIdList\":[1], \"podName\":\""$PODNAME"\", \"comments\":\"test respawn\"}" testdeployment

# deployment history
testApi `grep -w 29 apisnum | cut -d ' ' -f2` GET "" testdeployment 1

# deployment delete
testApi `grep -w 12 apisnum | cut -d ' ' -f2` POST "{\"userId\":\"7\", \"dcIdList\":[1], \"comments\":\"test delete\"}" testdeployment

# deployment operationlog
testApi `grep -w 15 apisnum | cut -d ' ' -f2` GET 

# registry images 
testApi `grep -w 16 apisnum | cut -d ' ' -f2` GET

# services
testApi `grep -w 17 apisnum | cut -d ' ' -f2` GET

# services init
testApi `grep -w 18 apisnum | cut -d ' ' -f2` GET

# service check
testApi `grep -w 20 apisnum | cut -d ' ' -f2` POST "{\"name\":\"testservice\"}"

# services new
testApi `grep -w 19 apisnum | cut -d ' ' -f2` POST "{\"serviceName\": \"testservice\",\"orgName\": \"dev\",\"dcIdList\": [1],\"service\": { \"kind\": \"service\", \"apiVersion\": \"v1\", \"metadata\": { \"name\": \"testservice\", \"namespace\": \"dev\", \"labels\": { \"name\": \"testservice\", \"author\":\"liyao.miao\", \"type\": \"service\" } }, \"spec\": { \"type\": \"ClusterIP\", \"selector\": { \"name\": \"testdeployment\" }, \"ports\": [ { \"name\": \"port\", \"protocol\": \"TCP\", \"port\": 80, \"targetPort\": 80 } ] } }}"

# service update
testApi `grep -w 21 apisnum | cut -d ' ' -f2` POST "  {\"serviceName\": \"testservice\",\"orgName\": \"dev\",\"dcIdList\": [1], \"service\": {\"kind\": \"Service\",  \"apiVersion\": \"v1\", \"metadata\": {  \"name\": \"testservice\",\"namespace\": \"dev\", \"labels\": { \"name\": \"testservice\",\"author\":\"liyao.miao\", \"type\": \"service\"  }},\"spec\": { \"type\": \"ClusterIP\", \"selector\": {  \"name\": \"testdeployment\"  }, \"ports\": [  {\"name\": \"port\",\"protocol\": \"TCP\",\"port\": 8080,\"targetPort\": 8080  } ]}  } }"

# service delete 
testApi `grep -w 22 apisnum | cut -d ' ' -f2` POST "" testservice    

# Endpoints was ommited temporarily
## endpoints
#testApi `grep -w 23 apisnum | cut -d ' ' -f2` GET
#
## endpoints init
#testApi `grep -w 24 apisnum | cut -d ' ' -f2` GET
#
## endpoints new
#testApi `grep -w 25 apisnum | cut -d ' ' -f2` POST "{}"
#
## endpoints check
#testApi `grep -w 26 apisnum | cut -d ' ' -f2` POST "{}"
#
## endpoints describe
#testApi `grep -w 27 apisnum | cut -d ' ' -f2` POST "" testendpoints

# extensions
testApi `grep -w 28 apisnum | cut -d ' ' -f2` GET

# topology
testApi `grep -w 30 apisnum | cut -d ' ' -f2` GET

# Below 3 have different return message format, omitted temporarily
## root
#testApi `grep -w 31 apisnum | cut -d ' ' -f2` GET
#
## version
#testApi `grep -w 32 apisnum | cut -d ' ' -f2` GET
#
## healthz
#testApi `grep -w 33 apisnum | cut -d ' ' -f2` GET

# deploymentstat
testApi `grep -w 34 apisnum | cut -d ' ' -f2` GET

# resourcestat
testApi `grep -w 35 apisnum | cut -d ' ' -f2` GET

# user init
testApi `grep -w 36 apisnum | cut -d ' ' -f2` GET 

# user check
testApi `grep -w 37 apisnum | cut -d ' ' -f2` POST "{\"userName\":\"test.user\",\"orgName\":\"dev\", \"orgId\":\"1\"}"

# user new
testApi `grep -w 38 apisnum | cut -d ' ' -f2` POST "{\"userName\":\"test.user\", \"password\":\"123456\", \"orgName\":\"dev\", \"orgId\":\"1\", \"op\":\"7\"}"

# user 
testApi `grep -w 39 apisnum | cut -d ' ' -f2` GET

# user update
testApi `grep -w 41 apisnum | cut -d ' ' -f2` POST "{\"op\":7, \"name\":\"test.user\",\"orgId\":\"1\",\"password\":\"12345\", \"orgName\":\"ops\"}"

# user selfUpdate
testApi `grep -w 42 apisnum | cut -d ' ' -f2` POST "{\"password\":\"123456\", \"name\":\"test.user\", \"orgName\":\"dev\", \"orgId\":\"1\"}"

# user checkpassword
testApi `grep -w 43 apisnum | cut -d ' ' -f2` POST "{\"password\":\"123456\"}" 

# user delete
testApi `grep -w 40 apisnum | cut -d ' ' -f2` POST "{\"op\":7,\"userName\":\"test.user\"}"

# organization check
testApi `grep -w 44 apisnum | cut -d ' ' -f2` POST "{\"orgName\":\"testorganization\", \"orgId\":\"1\"}"

# organization init
testApi `grep -w 45 apisnum | cut -d ' ' -f2` GET

# organization 
testApi `grep -w 46 apisnum | cut -d ' ' -f2` GET

# organization new
testApi `grep -w 47 apisnum | cut -d ' ' -f2` POST "{\"orgId\":\"1\", \"userId\":\"7\", \"name\":\"testorganization\", \"dcIdList\":[1]}"

# organization update
testApi `grep -w 48 apisnum | cut -d ' ' -f2` POST "{\"orgId\":\"1\", \"userId\":7, \"name\":\"testorganization-1\"}"

# organization delete
testApi `grep -w 49 apisnum | cut -d ' ' -f2` POST "{\"orgName\":\"testorganization-1\", \"orgId\":\"1\", \"op\":7}"


# operationstat
testApi `grep -w 50 apisnum | cut -d ' ' -f2` GET

# datacenter check
testApi `grep -w 55 apisnum | cut -d ' ' -f2` POST "{\"name\":\"testdatacenter\", \"orgId\":\"1\"}"

# datacenter new
testApi `grep -w 51 apisnum | cut -d ' ' -f2` POST "{\"name\":\"testdatacenter\", \"nodePort\":[\"30000\",\"30005\"],\"host\":\"127.0.0.1\", \"port\":8080, \"orgId\":\"1\", \"op\":7}"

# datacenter
testApi `grep -w 53 apisnum | cut -d ' ' -f2` GET

# datacenter update
testApi `grep -w 54 apisnum | cut -d ' ' -f2` POST "{\"op\":7, \"name\":\"testdatacenter\", \"orgId\":\"1\", \"nodePort\":[\"30000\",\"30007\"], \"host\":\"127.0.0.1\", \"port\":8080}"

# datacenter delete
testApi `grep -w 52 apisnum | cut -d ' ' -f2` POST "{\"op\":7, \"orgId\":\"1\", \"name\":\"testdatacenter\"}"

# nodeports
testApi `grep -w 56 apisnum | cut -d ' ' -f2` GET

# nodeports check
testApi `grep -w 57 apisnum | cut -d ' ' -f2` POST "{\"nodePort\":30000, \"dcIdList\":[1], \"orgId\":\"1\"}"

# templates check
testApi `grep -w 58 apisnum | cut -d ' ' -f2` POST "{\"name\":\"testtemplate\"}"

# templates new
testApi `grep -w 59 apisnum | cut -d ' ' -f2` POST "{\"name\":\"testtemplate\",\"deployment\":{},\"service\":{}}"

# template update
testApi `grep -w 60 apisnum | cut -d ' ' -f2` POST "{\"name\":\"testtemplate-1\",\"deployment\":{}, \"service\":{}}"

# template delete
testApi `grep -w 61 apisnum | cut -d ' ' -f2` POST "{\"name\":\"testtemplate\", \"id\":275}"
testApi `grep -w 61 apisnum | cut -d ' ' -f2` POST "{\"name\":\"testtemplate-1\", \"id\":276}"

# template 
testApi `grep -w 62 apisnum | cut -d ' ' -f2` GET

# logout
testApi `grep -w 2 apisnum | cut -d ' ' -f2` POST "{\"userName\":\"liyao.miao\", \"sessionId\":\"$SESSIONID\"}"

