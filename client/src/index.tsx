import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import { PhoenixProvider } from 'use-phoenix'

const root = ReactDOM.createRoot(document.getElementById("root")!);
root.render(
  <React.StrictMode>
    <PhoenixProvider>
      <App />
    </PhoenixProvider>
  </React.StrictMode>
);
