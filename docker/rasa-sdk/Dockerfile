# Extend the official Rasa SDK image.
FROM rasa/rasa-sdk:latest

# dockerfile maintainer name, surname and contact email.
MAINTAINER Aleksandar Rakić <aleksandar.rakic@yahoo.com>

# set current user as ROOT.
USER root

# Add a custom python libraries
RUN pip --no-cache-dir install requests

# set current user as 1001.
USER 1001