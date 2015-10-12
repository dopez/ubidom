# which sh
SOURCE_WEB_PATH=/engn001/ciserv/hudson/jobs/DSA_build/workspace/target/DSA/resource
TARGET_WEB_PATH=/sorc001/dsaweb/resource

sudo -u devweb rm -r $TARGET_WEB_PATH/*
sudo -u devweb cp -r $SOURCE_WEB_PATH/* $TARGET_WEB_PATH/

echo 'deploy web finished!'

