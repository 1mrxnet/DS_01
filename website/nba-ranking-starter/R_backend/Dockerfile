FROM rocker/plumber:latest

# (safe extras some tidyverse pkgs need)
RUN apt-get update && apt-get install -y libssl-dev libcurl4-openssl-dev libxml2-dev

WORKDIR /app
COPY . /app

# App dependencies (data wrangling, JSON, etc.)
RUN R -e "install.packages(c('jsonlite','dplyr','readr','tidyr','stringr'), repos='https://cloud.r-project.org')"

ENV PORT=8000
EXPOSE 8000

# Your CORS-enabled entrypoint
CMD ["Rscript","run_with_cors.R"]
