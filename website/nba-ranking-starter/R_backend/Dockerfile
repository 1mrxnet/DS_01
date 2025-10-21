FROM rocker/r-ver:4.3.1
ENV DEBIAN_FRONTEND=noninteractive

# --- Pin APT to Debian stable (bookworm) to avoid 'testing' key/signature errors ---
RUN sed -i 's/ testing/ bookworm/g; s/testing/ bookworm/g' /etc/apt/sources.list || true && \
    sed -i 's/ security/ bookworm-security/g' /etc/apt/sources.list || true

# System libs many CRAN pkgs need
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gfortran make pkg-config \
    libssl-dev libcurl4-openssl-dev libxml2-dev \
    libpng-dev libjpeg-dev libfontconfig1-dev libcairo2-dev \
    libicu-dev ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

# Use Posit Package Manager (binary CRAN) for reliable installs
RUN R -e "options(repos='https://packagemanager.posit.co/cran/latest'); \
          install.packages(c('plumber','jsonlite','dplyr','readr','tidyr','stringr'), \
          dependencies=TRUE)"

WORKDIR /app
# copy only backend context
COPY . /app/

ENV PORT=8000
EXPOSE 8000
CMD ["Rscript", "run_with_cors.R"]
