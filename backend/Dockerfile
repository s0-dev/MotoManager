# ------------------------
# Stage 1: Build
# ------------------------
  FROM dart:stable AS builder

  WORKDIR /app
  
  # 1. Copiar solo pubspec primero
  COPY pubspec.yaml ./
  
  # 2. Instalar dependencias
  RUN dart pub get
  
  # 3. Copiar todo el código
  COPY . .
  
  # 4. Reinstalar dependencias (offline)
  RUN dart pub get --offline
  
  # 5. Compilar
  RUN dart compile exe bin/server.dart -o bin/server
  
  # ------------------------
  # Stage 2: Runtime
  # ------------------------
  FROM dart:stable-sdk
  
  WORKDIR /app
  COPY --from=builder /app/ .
  
  # Usuario no-root
  RUN useradd -m -u 1001 appuser && chown -R appuser:appuser /app
  USER appuser
  
  EXPOSE 8080
  CMD ["./bin/server"]