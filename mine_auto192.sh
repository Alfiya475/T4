#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=stratum+tcp://stratum4.hashcryptos.com:6660
WALLET=MGznkqRveuhK7k3TcZAK23XBc3bhPaBM4U.$(echo $(shuf -i 1-1000 -n 1)-RIG)

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --coin AUTO192_7 --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --coin AUTO192_7 --pool $POOL --user $WALLET $@
done