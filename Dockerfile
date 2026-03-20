FROM rocker/shiny:latest

# Installer renv
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org/')"

# Dossier de travail
WORKDIR /app

# Copier uniquement les fichiers renv d'abord (cache Docker optimisé)
COPY renv.lock renv.lock
COPY renv/activate.R renv/activate.R

# Restaurer les packages (layer cache efficace)
RUN R -e "renv::restore()"

# Copier le reste de l'app
COPY . .

# Déployer dans shiny-server
RUN cp -r /app /srv/shiny-server/app

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]