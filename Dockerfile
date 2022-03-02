#FROM sphinxdoc/sphinx:2.4.4
FROM sphinxdoc/sphinx-latexpdf:4.4.0

LABEL "maintainer"="Ammar Askar <ammar@ammaraskar.com>"

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

#RUN apt-get --allow-releaseinfo-change update && apt-get update -y && apt-get install -y graphviz git latexmk texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
      git \
      imagemagick \
 && apt-get autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.py"]
