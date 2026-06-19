# LiveSketch: Real-Time Collaborative Drawing Platform

LiveSketch is an open-source real-time collaborative drawing application _designed for teams and creators_ to **brainstorm and visualize** ideas together seamlessly. Built with a modern **full-stack architecture**, it enables _multiple users to draw on a shared canvas in real-time_, with built-in tools for quick sketching, shape suggestions, and session management. 

## Overview
**The app leverages functional programming principles in the backend for reliable handling of concurrent user interactions and includes data analytics for monitoring usage patterns.**
This project demonstrates skills in building _interactive UIs, scalable backends, data processing, and containerized deployments—ideal_ for exploring distributed systems and real-time applications.

---
## Key Features

- **Real-Time Collaboration:** Users join sessions via WebSockets for synchronized drawing updates.
- **Intuitive UI Tools:** One-click access to brushes, shapes, and erasers with customizable options.
- **Intelligent Insights:** Backend analytics detect unusual activity (e.g., spam drawing) and suggest optimizations.
- **Seamless Integrations:** API hooks for external tool libraries (simulated).
- **Robust Infrastructure:** Dockerized services for easy local development and scaling.
- **Data Visualization:** Simple dashboards for viewing collaboration metrics.

---
## Tech Stack

- **Frontend:** React.js with Fabric.js for canvas rendering.
- **Backend:** Elixir with Phoenix for functional, concurrent logic.
- **Data Science:** Python with Pandas for anomaly detection and stats.
- **Infrastructure:** Docker Compose for multi-container setup.
- **Real-Time:** Phoenix Channels for live updates.

---
## Quick Start

### Prerequisites:

- Node.js (v18+)
- Elixir (v1.14+)
- Python (3.10+)
- Docker & Docker Compose


### Clone & Setup:

     git clone https://github.com/AmSh4/LiveSketch
     cd livesketch

### Backend Setup:
     cd server
     mix deps.get
     mix ecto.create  # If using DB, but here in-memory for simplicity
     mix phx.server

### Frontend Setup:

     cd client
     npm install
     npm start

### Data Analytics:
- Run the analysis script:
  
      cd ds
      pip install -r requirements.txt
      python analyze_logs.py

### Docker Deployment:
      docker-compose up --build
Access at `http://localhost:4000`.

---
## Architecture

- **Client:** React app handles UI rendering and sends canvas events via WebSockets.
- **Server:** Elixir Phoenix manages channels, processes updates functionally (immutable state, pattern matching).
- **Analytics:** Python script processes log data for insights like session duration and anomaly scores.
- **Infra:** Containers for isolation; simulate multi-DC with env vars.

---
## Folder Structure
- [View](https://github.com/AmSh4/LiveSketch/blob/main/Structure.md)
---
## Contributing
Fork the repo, create a branch, and submit a PR. Focus on adding new tools or improving analytics.

---
# Contributing

Contributions are welcome.

To contribute:

1. Fork the repository.
2. Create a feature branch.

```bash
git checkout -b feature-name
```

3. Commit your changes.

```bash
git commit -m "Add new feature"
```

4. Push the branch.

```bash
git push origin feature-name
```

5. Open a Pull Request.

---




## License
MIT License.
