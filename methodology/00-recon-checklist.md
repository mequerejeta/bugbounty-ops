# Recon — checklist base (correr por cada programa nuevo)

Objetivo: encontrar lo que el resto de los hunters no se molesta en buscar. La mayoría corre subfinder+nuclei y listo — tu ventaja está en los pasos manuales de abajo.

## Automatizado (ver recon/)
- [ ] Subdomain enumeration (subfinder, crt.sh)
- [ ] Probing HTTP vivo (httpx)
- [ ] Nuclei con templates actualizados (solo como triage inicial, no como fuente principal de hallazgos)

## Manual (acá está el valor real)
- [ ] Revisar todos los archivos JS de la app en busca de: endpoints de API no documentados, keys/tokens hardcodeados, comentarios de debug, rutas de admin
- [ ] Wayback Machine / gau — buscar endpoints históricos que quedaron vivos pero se sacaron de la nav
- [ ] Buscar paneles olvidados: `/admin`, `/internal`, `/staging`, subdominios tipo `dev-`, `test-`, `old-`
- [ ] Revisar el changelog / release notes público de la empresa — features nuevas = código nuevo = menos testeado
- [ ] GitHub dorking — repos públicos de la empresa o de empleados con configs/tokens filtrados
- [ ] Google/Shodan dorking sobre el dominio
- [ ] Mapear todos los roles de usuario disponibles (free/paid/admin/invitado) — la mayoría de los bugs buenos aparecen al comparar comportamiento entre roles

## Antes de reportar cualquier cosa
- [ ] Confirmar que el asset está en scope (releer policy, no asumir)
- [ ] Confirmar que no está marcado como "known issue" o excluido
- [ ] Reproducir el bug 2 veces desde cero (no solo screenshot de un intento)
