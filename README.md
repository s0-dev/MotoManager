# MotoManager

**MotoManager** es una aplicación móvil multiplataforma construida con Flutter que ayuda a los usuarios a gestionar el mantenimiento de sus motocicletas de forma organizada e inteligente. Este proyecto sirve como demostración de mis habilidades de integración de Flutter y backend.

## Features

  **TBD**

## Estructura del proyecto

```
motorcycle_manager/
├── frontend/              # Flutter app
│   ├── lib/
│   │   ├── models/        # Modelos de datos (User, Motorcycle) | implementando
│   │   ├── screens/       # UI screens (SplashScreen, LoginScreen, RegisterScreen & + por venir)
│   │   ├── services/      # Llamados a la API y almacenamiento local (SQLite) | implementando
│   │   ├── state/         # Manejadores de estados | implementando
│   │   ├── utils/         # Utilidades | implementando
│   │   └── main.dart      # Punto de entrada de la app 
│   ├── assets/            # Recursos | implementando
│   ├── pubspec.yaml       # Configuración de flutter | implementando
│   └── test/              # Tests del front | implementando
└── backend/               # Go backend API | implementando
    ├── cmd/               # Punto de entrada del backend | implementando
    ├── internal/          # Lógica capa de negocio | implementando
    │   ├── auth/          # Manejadores de auth | implementando
    │   ├── handlers/      # Endpoints de la API. | implementando
    │   ├── models/        # Modelos de datos en Go (User, Motorcycle) | implementando
    │   ├── repository/    # Capa de la base de datos | implementando
    │   └── services/      # Utilidades y lógica de negocio | implementando
    ├── config/            # Archivos de configuración | implementando
    └── Dockerfile         # Contenerización del backend | implementando
```

## Técnologias usadas

- **Frontend:**  
  - [Flutter](https://flutter.dev) & Dart  
  - SQLite para almacenamiento local
- **Backend:**  
  - [Go](https://golang.org)  
  - PostgreSQL como base de datos persistente  
  - Docker para contenerización, Minikube opcional para kubernetes local
- **CI/CD:**  
  - Jenkins para build, test y despliegue

## Configuración e instalación

  **TBD**