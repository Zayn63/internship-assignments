const express = require('express');
const bodyParser = require('body-parser');
const helmet = require('helmet');
const app = express();

app.use(helmet());
app.use(bodyParser.json());

const PORT = process.env.PORT || 1337;
const DEMO_EMAIL = process.env.DEMO_EMAIL || 'hire-me@anshumat.org';
const DEMO_PASSWORD = process.env.DEMO_PASSWORD || 'HireMe@2025!';

app.get('/', (req, res) => {
  res.json({ message: 'Hello — DevOps demo simulation. Visit /login to test demo credentials.' });
});

app.post('/login', (req, res) => {
  const { email, password } = req.body || {};
  if (!email || !password) {
    return res.status(400).json({ error: 'Email and password required.' });
  }
  if (email === DEMO_EMAIL && password === DEMO_PASSWORD) {
    return res.json({ success: true, message: 'Login successful', user: { email } });
  }
  return res.status(401).json({ error: 'Invalid credentials' });
});

app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));
