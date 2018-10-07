from microsoft/dotnet

ENV HELLOWORLD_DIR /opt/helloworld
RUN mkdir $HELLOWORLD_DIR
WORKDIR $HELLOWORLD_DIR
RUN git clone https://github.com/martincronje/dotnetcore-helloworld.git $HELLOWORLD_DIR
CMD dotnet run -p $HELLOWORLD_DIR/DotNetCoreHelloWorld
