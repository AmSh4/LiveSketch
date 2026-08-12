import React, { useState, useEffect } from "react";
import Canvas from "./components/Canvas";
import Toolbar from "./components/Toolbar";
import "./App.css";
import { usePhoenix } from "use-phoenix";

function App() {
  const [sessionId, setSessionId] = useState<string | null>(null);
  const { connect, isConnected } = usePhoenix();
  useEffect(() => { connect("ws://localhost:4000/websocket") }, [connect])

  return (
    <div className="App">
      <header>
        <h1>LiveSketch Collaborative Canvas</h1>
        {isConnected ? <span>Connected</span> : <span>Disconnected</span>}
      </header>
      <Toolbar onJoin={setSessionId} />
      <Canvas sessionId={sessionId} />
    </div>
  );
}

export default App;
