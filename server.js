const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Statische Dateien aus dem public Ordner servieren
app.use(express.static(path.join(__dirname, 'public')));

// Route für die Startseite
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// API Route für Hallo Welt
app.get('/api/hello', (req, res) => {
    res.json({ message: 'Hallo Welt 👋' });
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server läuft auf Port ${PORT}`);
});