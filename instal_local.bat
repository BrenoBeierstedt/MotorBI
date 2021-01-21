@echo off

rem echo "##### Building project database image..."
rem docker build -t iocom-neo4j ./neo4j
echo "##### Building project base image..."
docker build -t MotorBI-nodejs ./nodejs
echo "###Build Done!"

cd ..

echo "\n\n#####  Cloning Platform..."

git clone git@github.com:BrenoBeierstedt/idome-web.git

git clone git@github.com:BrenoBeierstedt/idome-api.git

rem git clone git@iocom:iocom-platform/iocom-web.git

rem git clone git@iocom:iocom-platform/iocom-api.git

echo "\n\n##### Copying composer..."
cp MotorBI\docker-compose-local.yml.sample docker-compose.yml

rm proxy.conf
echo "### Creating proxy.conf"
cat > proxy.conf <<EOL
server_tokens off;
client_max_body_size 200m;
EOL



echo As last step you need to manually edit /etc/hosts
echo in your PC (Mac and linux)

echo 127.0.0.1  adm.local.iocom.com
echo 127.0.0.1  api.local.iocom.com
echo 127.0.0.1  neo4j.local.iocom.com


cd idome

echo "\n\nAll done! Have a nice day!\n"
