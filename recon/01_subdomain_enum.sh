#!/usr/bin/env bash
# Enumeracion de subdominios para un target. Correr DENTRO de la Kali.
# Uso: ./01_subdomain_enum.sh dominio.com
set -euo pipefail

DOMAIN="${1:?Uso: $0 dominio.com}"
OUTDIR="../targets/${DOMAIN}/recon-output"
mkdir -p "$OUTDIR"

echo "[*] Subfinder..."
subfinder -d "$DOMAIN" -all -silent -o "$OUTDIR/subfinder.txt"

echo "[*] crt.sh..."
curl -s "https://crt.sh/?q=%25.${DOMAIN}&output=json" \
  | jq -r '.[].name_value' 2>/dev/null \
  | sed 's/\*\.//g' | sort -u > "$OUTDIR/crtsh.txt" || true

sort -u "$OUTDIR/subfinder.txt" "$OUTDIR/crtsh.txt" > "$OUTDIR/all-subdomains.txt"

echo "[*] Total subdominios unicos: $(wc -l < "$OUTDIR/all-subdomains.txt")"
echo "[*] Resultado: $OUTDIR/all-subdomains.txt"
