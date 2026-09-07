#!/usr/bin/env bash
# Prueba cuales subdominios estan vivos y responde HTTP. Correr DENTRO de la Kali.
# Uso: ./02_probe_and_screenshot.sh dominio.com
set -euo pipefail

DOMAIN="${1:?Uso: $0 dominio.com}"
OUTDIR="../targets/${DOMAIN}/recon-output"

if [ ! -f "$OUTDIR/all-subdomains.txt" ]; then
  echo "[!] Corre primero 01_subdomain_enum.sh"
  exit 1
fi

echo "[*] Probing con httpx..."
httpx -l "$OUTDIR/all-subdomains.txt" -silent -status-code -title -tech-detect \
  -o "$OUTDIR/httpx-results.txt"

echo "[*] Resultado: $OUTDIR/httpx-results.txt"
