# Base image, see https://hub.docker.com/r/rocker/rstudio
FROM rocker/tidyverse:3.5.1

# Install java and rJava
RUN apt-get -y update && apt-get install -y \
   default-jdk \
   r-cran-rjava \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/

# Install ODBC stuff
RUN apt-get -y update && apt-get install -y --install-suggests \
   unixodbc unixodbc-dev \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/

# Install further R packages
RUN install2.r --error --deps TRUE \
   RJDBC \
   odbc \
   && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

