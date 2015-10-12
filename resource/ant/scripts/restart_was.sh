# which sh


WAS_ID='`hostname`'
export WAS_ID

cd /engn001/jeus6/bin
sleep 3

#jeusadmin $WAS_ID -Uadministrator -Pjeusamdin jeusexit
#jeusadmin dsdap01 -Uadministrator -Pjeusadmin jeusexit
jcdown $1

sleep 5

#nohup jeus -xml -Uadministrator -Pjeusadmin &
BUILD_ID=dontKillMe jcboot $1

sleep 5

echo 'deploy web finished!'

