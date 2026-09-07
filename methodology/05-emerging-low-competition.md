# Categorías emergentes de baja competencia

Estas categorías pagan bien y todavía tienen pocos hunters testeándolas activamente — buena zona para diferenciarte como principiante. Basado en contraste contra writeups reales (pentester.land, hacktivity).

## Supply chain / dependency confusion
- [ ] Revisar `package.json`/`requirements.txt`/etc. filtrados en repos públicos de la empresa (o en el JS bundle, que a veces lista deps internas) — buscar paquetes con scope interno (`@empresa/paquete-interno`) que NO existan en el registry público (npm/PyPI). Si podés publicar vos ese nombre, es dependency confusion.
- [ ] CI/CD mal configurado expuesto públicamente (GitHub Actions con secrets en logs, workflows que corren en PRs de forks)

## AI / LLM (si la app tiene chatbot, asistente, o feature "con IA")
- [ ] Prompt injection: ¿el LLM tiene acceso a datos/acciones de otros usuarios? ¿se le puede hacer ignorar sus instrucciones del sistema vía input del usuario?
- [ ] Exfiltración de datos vía el LLM: ¿el modelo puede ser inducido a filtrar el system prompt, datos de otro usuario en su contexto, o resultados de tool-calls que no debería exponer?
- [ ] Si el LLM ejecuta acciones (tools/function calling) — tratarlo como un usuario más: ¿tiene los mismos chequeos de autorización que un endpoint normal, o el LLM "bypasea" la capa de auth por venir del backend?

## Hábito recomendado
Dedicar ~30 min/semana a leer writeups nuevos en pentester.land (filtrando por tag) para mantener este archivo actualizado con lo que realmente se está pagando, no solo lo que dice la teoría de hace 5 años.
