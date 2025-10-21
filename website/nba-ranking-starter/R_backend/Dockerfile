FROM rocker/r-ver:4.3.1
RUN apt-get update && apt-get install -y libssl-dev libcurl4-openssl-dev libxml2-dev
RUN R -e "install.packages(c('plumber','jsonlite','dplyr','readr','tidyr','stringr'), repos='https://cloud.r-project.org')"
WORKDIR /app
COPY . /app
ENV PORT=8000
EXPOSE 8000
CMD ["Rscript","run_with_cors.R"]
