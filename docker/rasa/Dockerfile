# rasa image with the latest rasa version.
FROM rasa/rasa:latest-full

# dockerfile maintainer name, surname and contact email.
MAINTAINER Aleksandar Rakić <aleksandar.rakic@yahoo.com>

# set user root.
USER root

# make sure we use the virtualenv.
ENV PATH="/opt/venv/bin:$PATH"

# install required packages.
RUN pip install rasa[spacy]

# spacy link.
RUN python -m spacy download hr_core_news_lg

# set user rasa.
USER rasa

# expose ports 5005 to outside world.
EXPOSE 5005