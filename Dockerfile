FROM amazonlinux
WORKDIR /pgcluster
COPY --chmod=555 install.sh .
RUN ./install.sh

USER postgres
WORKDIR /usr/local/pgsql/bin
COPY --chmod=555 start.sh .
CMD ./start.sh
