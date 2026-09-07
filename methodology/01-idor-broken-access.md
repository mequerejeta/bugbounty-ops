# IDOR / Broken Access Control

Referencia: OWASP WSTG-ATHZ. Esta es probablemente la categoría con mejor ratio esfuerzo/hallazgo para alguien que viene de dev — entendés el modelo de datos mejor que el hunter promedio.

## Checklist
- [ ] Mapear TODOS los endpoints que reciben un ID (user_id, order_id, invoice_id, doc_id...) — armar una lista mientras navegás la app normalmente
- [ ] Por cada endpoint: crear 2 cuentas de test (A y B), reproducir la acción con el ID del recurso de A logueado como B
- [ ] Probar no solo GET — POST/PUT/DELETE/PATCH sobre recursos ajenos suelen estar menos protegidos que el GET
- [ ] IDs no secuenciales (UUID) no significa seguro — probar si el UUID se filtra en otra respuesta (ej. en una lista, en un export, en un JS)
- [ ] Probar cambiando el Content-Type o mandando el ID en body en vez de en la URL (algunos frameworks solo validan auth en un path)
- [ ] Mass assignment: en un PUT/PATCH de perfil, probar mandar campos que no deberían ser editables (`role`, `is_admin`, `balance`, `verified`)
- [ ] Probar acceso directo a recursos vía API interna aunque el frontend no la exponga (buscada en el JS)
- [ ] Downgrade de rol: usuario admin baja a user, ¿el JWT/sesión vieja sigue con permisos viejos?

## Nota desde tu experiencia de dev
Pensá en cómo VOS implementarías el chequeo de ownership en un backend — típicamente se olvida en: exports/reportes, endpoints de "compartir", websockets, endpoints de admin reusados para self-service, y en cualquier función agregada rápido bajo presión de deadline (buscá features "nuevas" del changelog).
