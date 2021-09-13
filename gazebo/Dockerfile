FROM gazebo:gzserver11
# place here your application's setup specifics

WORKDIR /
COPY . .

EXPOSE 11345/tcp
EXPOSE 11345/udp

CMD [ "gzserver", "test.world" ]
