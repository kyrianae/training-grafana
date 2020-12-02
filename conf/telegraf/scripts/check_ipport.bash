SERVER=$1
PORT=$2
SOFT=$3
PROTOCOL=$4
CLUSTER=$5
ZONE=$6
INSTANCE=$7
#SERVER=$8

STATE=OK
STATUS=0
timeout -k 0.9s 1s bash -c "cat </dev/null >/dev/tcp/${SERVER}/${PORT}" >/dev/null 2>&1
result=$?
if [ "$result" -eq 124  ]; then
  STATE=UKNOWN
  STATUS=2
elif [ "$result" -gt 0 ]; then
  STATE=KO
  STATUS=1
fi
echo ipport,soft=$SOFT,protocol=$PROTOCOL,server=$SERVER,port=${PORT},zone=${ZONE},cluster=${CLUSTER},instance=${INSTANCE},state_tag=${STATE} state=${STATUS}i,result=${result}i
