# Script para rodar o site Jekyll localmente usando Docker
Write-Host "Iniciando servidor Jekyll..." -ForegroundColor Green
Write-Host "Acesse http://localhost:4000 quando estiver pronto" -ForegroundColor Cyan
Write-Host "Pressione Ctrl+C para parar" -ForegroundColor Yellow
Write-Host ""

docker run --rm -it -p 4000:4000 -v E:\.github:/srv/jekyll jekyll/jekyll:4 sh -c "bundle install && bundle exec jekyll serve --host 0.0.0.0 --force_polling"
