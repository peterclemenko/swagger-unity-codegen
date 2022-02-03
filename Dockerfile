## We specify the base image we need for our
## go application
FROM golang:rc-alpine3.15
## We create an /app directory within our
## image that will hold our application source
## files
RUN mkdir /app

RUN git clone https://github.com/recolude/swagger-unity-codegen.git
## We copy everything in the root directory
## into our /app directory
ADD . /app
## We specify that we now wish to execute 
## any further commands inside our /app
## directory
WORKDIR /app/swagger-unity-codegen

RUN go install /app/swag3d

## we run go build to compile the binary
## executable of our Go program
RUN go build -o swag3d .
## Our start command which kicks off
## our newly created binary executable
CMD ["/app/swag3d"]
