# Autenticación / Sesión

Referencia: OWASP WSTG-ATHN.

## Checklist
- [ ] Password reset: ¿el token expira? ¿es predecible? ¿se invalida el anterior al pedir uno nuevo? ¿se puede reusar después de usarlo?
- [ ] Password reset: ¿el response leakea si el email existe o no? ¿se puede resetear la password de otro sabiendo solo el email?
- [ ] 2FA: ¿se puede bypassear cambiando el response de la API (`"success":false` a `true`)? ¿rate limit en el código de 2FA? ¿se puede saltar directo a la página post-login?
- [ ] JWT: ¿algoritmo `none` aceptado? ¿se puede firmar con la public key como si fuera el secret (alg confusion RS256→HS256)? ¿expiración real vs solo en el claim?
- [ ] Registro: ¿se puede registrar con el mismo email que una cuenta OAuth existente y tomar la cuenta? (account takeover vía linking)
- [ ] Logout: ¿el token/sesión se invalida server-side o solo se borra del cliente?
- [ ] Rate limiting en login — probar bypass con headers tipo `X-Forwarded-For` random por request
- [ ] Session fixation: ¿el session ID cambia después del login?
