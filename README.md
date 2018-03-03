# moonfish-whitepaper

## Structure

```
|-- include
|   |-- moonfish-logo.pdf   <--- vector image for logo
|   `-- template.tex        <--- LaTeX template, design tewaks here
|-- Dockerfile
|-- Makefile
|-- README.md
|-- whitepaper.bib          <--- Bibliography
|-- whitepaper.md           <--- Whitepaper source
`-- whitepaper.pdf          <--- Output from runnning make
```
## Building

### With Docker

If you have docker installed and internet connectivity simply executing `make` in the root of this repository will render the markdown through LaTeX to a PDF

A `Dockerfile` is provided if you prefer to build the docker image locally

### Without docker

#### Install texlive and supporting tools (Linux)

Linix:
```
apt-get update -y && \

  apt-get install -y --no-install-recommends \
    make \
    git \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-luatex \
    fontconfig \
    pandoc \
    pandoc-citeproc \
    python3-pandocfilters \
    lmodern \
    wget \
    xzdec && \
  useradd -ms /bin/bash pandoc
```

#### Install texlive and supporting tools (macOS)

TODO

#### Install LaTeX support packages (Mac & Linux)

```
tlmgr init-usertree ; \
  tlmgr update --self && \
  tlmgr install lastpage && \
  tlmgr install tufte-latex && \
  tlmgr install changepage && \
  tlmgr install paralist && \
  tlmgr install titlesec && \
  tlmgr install ec && \
  tlmgr install units && \
  tlmgr install lipsum && \
  tlmgr install palatino && \
  tlmgr install mathpazo && \
  tlmgr install fpl && \
  tlmgr install ucs && \
  tlmgr install etoolbox && \
  tlmgr install fontawesome
```

