# Estructura y Convenciones del Proyecto

Este repositorio contiene la estructura modular para la redacción de la tesis en LaTeX.

## Árbol del Proyecto

```text
src/
├── main.tex
│
├── Chapters/
│   ├── 01-introduccion/
│   │   ├── index.tex
│   │   ├── motivacion.tex
│   │   ├── objetivos.tex
│   │   ├── estructura.tex
│   │   └── figures/
│   │       ├── contexto.png
│   │       └── flujo.pdf
│   │
│   ├── 02-marco-teorico/
│   │   ├── index.tex
│   │   ├── algoritmos.tex
│   │   ├── timetabling.tex
│   │   ├── metaheuristicas.tex
│   │   └── figures/
│   │       ├── clasificacion.png
│   │       └── modelo.pdf
│   │
│   └── 03-metodologia/
│       ├── index.tex
│       ├── enfoque.tex
│       ├── datasets.tex
│       ├── experimentos.tex
│       └── figures/
│           └── arquitectura.png
│
├── References/
│   └── references.bib
│
├── FrontMatter/
│   ├── dedication.tex
│   ├── acknowledgement.tex
│   ├── abstract.tex
│   └── resumen.tex
│
├── Appendices/
│   ├── 01-datos/
│   │   ├── index.tex
│   │   └── figures/
│   └── 02-resultados/
│       ├── index.tex
│       └── figures/
│
└── config/
    ├── Classes/
    └── Styles/

```

## Reglas de Organización

* **Capítulos y Apéndices:** Cada capítulo y apéndice tiene su propia carpeta dentro de
  `Chapters/` o `Appendices/`, nombrada con formato `numero-nombre` (`01-introduccion`,
  `02-marco-teorico`).
* **Orquestación:** Cada carpeta contiene un `index.tex` que importa los subarchivos del
  capítulo en el orden correspondiente y contiene configuracion especifica de ser necesario.
* **Figuras:** Se guardan dentro de la carpeta `figures/` del capítulo respectivo.
  Los nombres deben describir directamente su contenido sin usar numeraciones
  (`descripcion_de_figura.png`).

>NOTA: Los nombres de figuras deben de ser completamente descriptivos. **NO** se aceptan nombres
>como `figura1.png` o `tabla_calculos.png`

## Convención para Etiquetas (`\label`)

Las referencias cruzadas usan obligatoriamente el esquema `tipo:capitulo:descripcion`.

Ejemplo:
```text
\label{tipo:capitulo:que\_hace}
```

| Tipo         | Prefijo | Ejemplo                                  |
| ---          | ---     | ---                                      |
| **Capítulo** | `chap:` | `\label{chap:introduccion:contexto}`     |
| **Sección**  | `sec:`  | `\label{sec:marco-teorico:estado-arte}`  |
| **Figura**   | `fig:`  | `\label{fig:metodologia:diagrama-flujo}` |
| **Tabla**    | `tab:`  | `\label{tab:resultados:comparativa}`     |
| **Ecuación** | `eq:`   | `\label{eq:resultados:costo}`            |
