# MotoManager

**MotoManager** es una aplicación móvil multiplataforma construida con Flutter que ayuda a los usuarios a gestionar el mantenimiento de sus motocicletas de forma organizada e inteligente. Este proyecto sirve como demostración de mis habilidades de integración de Flutter y backend.

## Features

  **TBD**

## Estructura del proyecto

```
motorcycle_manager/
├── frontend/              # Flutter app
│   ├── lib/
│   │   ├── models/        # Modelos de datos (User, Motorcycle)
│   │   ├── screens/       # UI screens
│   │   ├── services/      # Llamados a la API y almacenamiento local (SQLite) | implementando
│   │   ├── state/         # Manejadores de estados | implementando
│   │   ├── utils/         # Utilidades | implementando
│   │   └── main.dart      # Punto de entrada de la app 
│   ├── assets/            # Recursos
│   ├── pubspec.yaml       # Configuración de flutter
│   └── test/              # Tests del front | implementando
└── backend/               # Dart backend API | implementando
│   ├── docker-compose.yml # orquestador de postgres y backend
    └── Dockerfile         # Contenerización del backend
```

## Técnologias usadas

- **Frontend:**  
  - [Flutter](https://flutter.dev)
  - SQLite para almacenamiento local | implementando
- **Backend:**  
  - Dart
  - PostgreSQL como base de datos persistente
  - Docker para contenerización
- **CI/CD:**  
  - Jenkins para build, test y despliegue | implementando

## Configuración e instalación

  **TBD**
