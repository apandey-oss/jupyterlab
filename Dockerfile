# FROM quay.io/jupyter/all-spark-notebook:ubuntu-24.04
FROM quay.io/jupyter/datascience-notebook:ubuntu-24.04

USER root
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y curl build-essential gcc pkg-config libssl-dev rustup graphviz && \
    apt-get clean
RUN rustup default stable
RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin
RUN mkdir /home/jovyan/notebooks && chown -R jovyan /home/jovyan/notebooks

USER jovyan
RUN pip install --no-cache-dir --user duckdb "polars[all]" vegafusion[embed] hvplot plotnine great_tables
ENTRYPOINT [ "start-notebook.py" ]
