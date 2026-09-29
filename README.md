# bugbounty-ops

Repo personal de metodología, tracking y automatización para bug bounty. No es el entorno de ataque — eso es la VM de Kali (VirtualBox). Este repo es la capa de conocimiento versionada: checklists, scripts de recon y notas por programa.

## Workflow

1. Editás/mantenés este repo desde Windows (VSCode) o directo en la VM.
2. Sincronizás la metodología vía git: este repo es público, así que hacés `git clone`/`git pull` adentro de la Kali sin credenciales.
3. Los scripts de `recon/` están pensados para correr DENTRO de la Kali (bash, herramientas Linux). No corren en Windows.
4. Todo el trabajo activo sobre un programa vive en `targets/<nombre-programa>/` — scope, notas, hallazgos. **Esa carpeta no se versiona** (está en `.gitignore`): puede tener hallazgos sin reportar, y publicarlos rompe la política de divulgación del programa. Para moverla entre Windows y la Kali usá una carpeta compartida de VirtualBox o un repo privado aparte.
5. Antes de reportar algo, pasás por `reports/template.md`.

## Regla de oro de scope

Nunca corras nada (ni siquiera recon pasivo) contra un target sin haber confirmado que está en el scope vigente del programa (leer la policy completa, no solo el dominio). Guardá una copia del scope del día que empezás en `targets/<programa>/scope.md` — los scopes cambian.

## Estructura

- `methodology/` — checklists por clase de vulnerabilidad, basados en OWASP WSTG/ASVS. Es el "spec" que seguís en cada target.
- `recon/` — scripts bash de automatización (subdomain enum, probing, nuclei) para correr en Kali.
- `targets/` — una carpeta por programa activo. Copiá `_template/` para arrancar uno nuevo.
- `reports/` — template de reporte y notas de qué hace que un reporte se acepte rápido.

## Instalación de herramientas en la Kali (una vez)

```bash
sudo apt update && sudo apt install -y golang-go jq
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/ffuf/ffuf/v2@latest
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
```
