# mongodb-docker

Docker image for MongoDB2.4

**Get it running:**

``$ docker-compose up``

**Testing the running MongoDB**

To test the running container we can use any client, even the commandline one:

``mongo --host localhost --port 27017``

_Please note that localhost is only valid if you are running Docker on Ubuntu/Debian. If you are an OSX user, you need to discover the correct ip using: boot2docker ip_