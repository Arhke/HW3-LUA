# Dafny Local Gradescope Image 
# Updated: March 29st 2023

# 1) Build the Docker image:
#      docker build -f Dockerfile --tag dafny .   
# 2) Run the Docker container, mapping your current 
#    directory into the `/connect` directory inside the container
#       docker run -v "$(PWD)/:/connect" -w /connect/ -it dafny
#    If the above line does not work, you may need to use `pwd` instead of `PWD`
# 3) Inside the Docker container, you'll find Dafny installed in:
#       /opt/dafny/dafny
#
# Note: If you are using a new Mac CPU (M1, M1 Pro, etc.), then when you run
# the commmands above, you should replace `build` with `build --platform linux/amd64` 
# and `run` with `run --platform linux/amd64`



FROM ubuntu:22.04
ENV REFRESH_DATE "2023-06-03"

RUN apt-get update

# install useful utilities
RUN apt-get install -y wget vim less dotnet-sdk-8.0

# install dafny4.11.0
RUN apt install -qy curl unzip
RUN curl -L https://github.com/dafny-lang/dafny/releases/download/v4.11.0/dafny-4.11.0-x64-ubuntu-22.04.zip -o /opt/dafny.zip \
&& (cd /opt && unzip dafny.zip && rm dafny.zip)

# libgompl is needed to run z3
RUN apt install -qy libgomp1 

# Convenience mapping
RUN mkdir /connect
WORKDIR /connect
CMD "/bin/bash"

