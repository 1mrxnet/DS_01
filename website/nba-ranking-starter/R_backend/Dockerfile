FROM rocker/r-base:4.3.1

# system libs many R pkgs need
RUN apt-get update && apt-get install -y \
    libssl-dev libcurl4-openssl-dev libxml2-dev && \
    rm -rf /var/lib/apt/lists/*

# install R packages (use Posit Package Manager for reliability)
RUN R -e "options(repos='https://packagemanager.posit.co/cran/latest'); \
          install.packages(c('plumber','jsonlite','dplyr','readr','tidyr','stringr'), \
          dependencies=TRUE)"

WORKDIR /app
COPY . /app

ENV PORT=8000
EXPOSE 8000

# start the API (CORS-enabled script you already have)
CMD [\"Rscript\",\"run_with_cors.R\"]
