# Runing a sinatra application in a tiny base image in Docker

This is sample project for running a Sinatra application on Docker on top minimal Sinatra base image.

###Step 1:

Create your sinatra application in the app/sinatra folder. If you change the name you will have to modify the name in the Docker file and scripts (not a hard thing). Replace the current sample app with yours 

##Step 2:

Do any gems require native compile? You can check this just by building the Docker image from the app folder.  If no errors, you are great. Otherwise modify the apk lines in the app/scripts/bundle_it.sh as you can see postgresql dev development library was added in the example and add required libraries.

Step 3: 

Build the Docker image while in the app folder (not the sinatra folder): docker build -t app_name .

Step 4:

Run container saving the container ID: export SINATRA=$(docker run -d -p 5678:5678 app_name)

You can access it from your browser, http://localhost:5678/ (or the container ip)

Sample Endpoints in this project:
- `/`     A welcome message
- `/disk` disk information via`df -h`
- `/env`  Environment information.
- `/memory` memory information via `free -m`
- `/exit` send TERM signal to app i.e. exit correctly
- `/fail` send KILL to app i.e. exit *incorrectly*


Logs are available: docker logs $SINATRA


Stop it: docker stop $SINATRA


Delete it : docker rm $SINATRA

## How it works
The Dockerfile will copy your app folder to the /home/sinatra folder in the container.
It copies the Gemfile first and loads the necessary development system, then bundles the gems 
and finally removes the development system.  This is what makes the image small compared to all the others. In a normal container the full development system is kept in the image.

The important thing is you have to do all this in one layer in order to remove the un-needed development files. That is why it is all done in a script. You can not delete anything from lower layers.
gain

To do the same thing in you own app without overlaying the sinatra folder just copy the Dockerfile and bundle_it.sh files to your new project. Be sure to make folder name corrections.

