# SSRF / Injection (SQLi, XSS, etc.)

Referencia: OWASP WSTG-INPV.

## SSRF — dónde buscar
- [ ] Cualquier feature que "traiga" contenido de una URL dada por el usuario: preview de link, webhook config, import de imagen por URL, PDF generator, integración con servicio externo
- [ ] Probar apuntar a `http://169.254.169.254/` (metadata de cloud), `http://localhost`, puertos internos comunes
- [ ] Probar bypasses de filtro: URLs con redirect (302 hacia el target interno), DNS rebinding, IPs en decimal/octal, `[::]`

## XSS
- [ ] Todo input reflejado sin filtro de contexto (HTML, atributo, JS, URL)
- [ ] Stored XSS en campos que se ven en el panel de OTRO usuario/rol (nombre de perfil, soporte/tickets, reviews)
- [ ] Bypass de CSP: revisar la policy real, buscar `unsafe-inline`, dominios en whitelist explotables (JSONP endpoints, CDNs abiertos)

## SQLi / NoSQLi
- [ ] Params numéricos y de filtro/orden (`sort=`, `order=`) suelen no sanitizarse igual que los de búsqueda
- [ ] NoSQL: probar operadores (`$ne`, `$gt`) en JSON bodies de login/búsqueda

No corras herramientas de explotación automática pesada (sqlmap en modo agresivo, etc.) sin confirmar que el programa lo permite explícitamente en su policy.
