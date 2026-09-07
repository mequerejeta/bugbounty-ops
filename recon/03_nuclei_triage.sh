#!/usr/bin/env bash
# Triage rapido con nuclei (NO es tu fuente principal de hallazgos, solo descarta lo obvio). Correr DENTRO de la Kali.
# Uso: ./03_nuclei_triage.sh dominio.com
set -euo pipefail

DOMAIN="${1:?Uso: $0 dominio.com}"
OUTDIR="../targets/${DOMAIN}/recon-output"

if [ ! -f "$OUTDIR/httpx-results.txt" ]; then
  echo "[!] Corre primero 02_probe_and_screenshot.sh"
  exit 1
fi

awk '{print $1}' "$OUTDIR/httpx-results.txt" > "$OUTDIR/live-urls.txt"

echo "[*] Nuclei (templates actualizados)..."
nuclei -update-templates -silent
nuclei -l "$OUTDIR/live-urls.txt" -severity low,medium,high,critical \
  -o "$OUTDIR/nuclei-results.txt"

echo "[*] Resultado: $OUTDIR/nuclei-results.txt"
echo "[!] Recordatorio: esto es solo triage. El trabajo manual (ver methodology/) es donde esta el valor real."
