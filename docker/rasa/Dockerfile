# rasa image latest full.
FROM rasa/rasa:latest-full

# dockerfile maintainer name, surname and contact email.
MAINTAINER Aleksandar Rakić <aleksandar.rakic@yahoo.com>

# set user root.
USER root

# make sure we use the virtualenv.
ENV PATH="/opt/venv/bin:$PATH"

# install required packages.
RUN pip3 install rasa[spacy]

# spacy link.
RUN python -m spacy download hr_core_news_lg && \
    python -m spacy link hr_core_news_lg hr

# set user rasa.
USER rasa

# expose ports 5005 and 5010 to outside world.
EXPOSE 5005 5010
