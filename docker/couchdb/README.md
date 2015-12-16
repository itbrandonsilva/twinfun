# To build the image

Have your couchdb `local.ini` in the same folder as the Dockerfile and run  
`docker build -t couchdb .`

# To run a container

`docker run -p 5984:5984 -d couchdb`
