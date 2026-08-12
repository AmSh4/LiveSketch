import React, { useState } from 'react';

const Toolbar = ({ onJoin }) => {
  const [sessionInput, setSessionInput] = useState('');

  const handleJoin = () => {
    if (sessionInput) {
      onJoin(sessionInput);
    }
  };

  const quickTools = [
    { name: 'Brush', action: () => console.log('Brush selected') },
    { name: 'Eraser', action: () => console.log('Eraser selected') },
    { name: 'Shape', action: () => console.log('Shape tool') },
  ];

  return (
    <div className="toolbar">
      <input
        type="text"
        placeholder="Enter session ID"
        value={sessionInput}
        onChange={(e) => setSessionInput(e.target.value)}
      />
      <button onClick={handleJoin}>Join Session</button>
      <div className="tools">
        {quickTools.map((tool, idx) => (
          <button key={idx} onClick={tool.action}>{tool.name}</button>
        ))}
      </div>
    </div>
  );
};

export default Toolbar;