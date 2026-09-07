# Lógica de negocio

Esta categoría no la encuentra ningún scanner — es 100% manual y es donde más rinde venir de desarrollo (entendés qué asumió el dev al escribir el flujo).

## Checklist
- [ ] Flujos de pago/checkout: ¿se puede modificar precio/cantidad/moneda en el request antes de confirmar? ¿repetir el mismo request de "aplicar cupón" varias veces?
- [ ] Race conditions: acciones que deberían ser "una sola vez" (canjear cupón, votar, transferir saldo) disparadas en paralelo (Burp Turbo Intruder / script simple con requests concurrentes)
- [ ] Flujos multi-step (wizard, checkout, onboarding): saltear pasos yendo directo al último endpoint
- [ ] Límites de negocio (ej. "máximo 3 invitaciones gratis"): ¿se valida server-side o solo en el frontend?
- [ ] Estados inconsistentes: cancelar una orden mientras se está procesando el pago, ¿en qué estado queda?
- [ ] Referral/invite systems: ¿se puede auto-referirse o inflar recompensas?
