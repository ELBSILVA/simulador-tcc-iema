#!/bin/bash
# Monta o zip offline do simulador (GitHub Actions ou teste local)
set -e
BUILD=${1:-0}; DATA=${2:-$(date +%d/%m/%Y)}
D=dist/Simulador_TCC_IEMA_2026
rm -rf dist; mkdir -p $D
cp -r organiza stocktech ecofood Logo_IEMA_Organiza.png Logo_StockTech.png Logo_EcoFood.png logo_iema.png $D/
sed -e "s|__BUILD__|$BUILD|" -e "s|__DATA__|$DATA|" index.html > $D/ABRIR_SIMULADOR.html
cp scripts/LEIA-ME.txt $D/
(cd dist && zip -qr Simulador_TCC_IEMA_2026.zip Simulador_TCC_IEMA_2026)
