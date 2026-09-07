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

## SSTI (Server-Side Template Injection)
- [ ] Cualquier input que termine renderizado en un template del server (emails transaccionales, generación de PDF/reportes, "preview" de contenido) — probar payloads básicos (`{{7*7}}`, `${7*7}`, `<%= 7*7 %>`) según el motor sospechado
- [ ] Especial atención a features de "personalización" de mensajes/plantillas expuestas a usuarios (ej. constructores de email marketing, firmas, notificaciones custom)

## XXE / LFI
- [ ] Cualquier endpoint que acepte XML (upload, SOAP, SAML) — probar DOCTYPE con entidad externa
- [ ] Cualquier feature que lea un archivo por path/nombre dado por el usuario (export, template, logo, import) — probar path traversal (`../../../../etc/passwd`) y wrappers (`php://filter`, etc. según el stack)

No corras herramientas de explotación automática pesada (sqlmap en modo agresivo, etc.) sin confirmar que el programa lo permite explícitamente en su policy.
