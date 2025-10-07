# Node.js 18 LTS Alpine image verwenden für kleinen Container
FROM node:18-alpine

# Arbeitsverzeichnis im Container
WORKDIR /app

# Package.json und package-lock.json kopieren
COPY package*.json ./

# Dependencies installieren
RUN npm ci --omit=dev

# Anwendungscode kopieren
COPY . .

# Port 3000 für die Anwendung freigeben
EXPOSE 3000

# User für bessere Sicherheit erstellen
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nextjs -u 1001

# Berechtigungen setzen
RUN chown -R nextjs:nodejs /app
USER nextjs

# Anwendung starten
CMD ["npm", "start"]