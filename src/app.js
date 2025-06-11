import React, { useEffect, useState } from 'react';

function App() {
  const [message, setMessage] = useState('Loading...');

  useEffect(() => {
    fetch('http://python-backend-2.keygn-dev.svc.cluster.local:8080/api/message')
      .then(res => res.json())
      .then(data => setMessage(data.message))
      .catch(() => setMessage('Error connecting to backend'));
  }, []);

  return (
    <div style={{ padding: 20 }}>
      <h1>Frontend connected to Backend</h1>
      <p>Backend says: {message}</p>
    </div>
  );
}

export default App;
