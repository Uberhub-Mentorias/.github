@echo off
REM Script para rodar o site Jekyll localmente usando Docker
echo Iniciando servidor Jekyll...
echo Acesse http://localhost:4000 quando estiver pronto
echo Pressione Ctrl+C para parar
echo.
docker run --rm -it -p 4000:4000 -v E:\.github:/srv/jekyll jekyll/jekyll:4 sh -c "bundle install && bundle exec jekyll serve --host 0.0.0.0 --force_polling"
