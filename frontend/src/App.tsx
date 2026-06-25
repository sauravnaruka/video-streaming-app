import { useEffect, useState } from 'react'

type HealthStatus = { status: string; version: string }

function App() {
  const [health, setHealth] = useState<HealthStatus | null>(null)

  useEffect(() => {
    fetch('/api/health')
      .then((res) => res.json())
      .then(setHealth)
      .catch(() => setHealth({ status: 'UNREACHABLE', version: '' }))
  }, [])

  return (
    <main>
      <h1>Video Streaming App</h1>
      <p className="status">
        Backend:{' '}
        {health ? `${health.status} (v${health.version})` : 'connecting…'}
      </p>
    </main>
  )
}

export default App
