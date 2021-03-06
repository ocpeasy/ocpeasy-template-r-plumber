# example Dockerfile to expose a plumber service

FROM trestletech/plumber

# install the custom packages
# RUN R -e 'install.packages(c("randomForest"))'

# copy model and scoring script
RUN mkdir /workdir
COPY api.R /workdir

# plumb and run server
EXPOSE 8080
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/workdir/api.R'); pr$run(host='0.0.0.0', port=8080)"]

