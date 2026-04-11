        livesketch/
        ├── README.md
        ├── .gitignore
        ├── docker-compose.yml
        ├── client/                 # React Frontend
        │   ├── package.json
        │   ├── public/
        │   │   └── index.html
        │   └── src/
        │       ├── App.js
        │       ├── index.js
        │       └── components/
        │           ├── Canvas.js
        │           └── Toolbar.js
        ├── server/                 # Elixir Backend
        │   ├── mix.exs
        │   ├── lib/
        │       ├── live_sketch/
        │       │   └── application.ex
        │       └── live_sketch_web/
        │       │       ├── endpoint.ex
        │       │       ├── router.ex
        │       │       └── live/
        │       │           └── sketch_live.ex
        │   └── config/
        │       └── dev.exs
        ├── ds/                     # Data Science Scripts
        │   ├── requirements.txt
        │   ├── analyze_logs.py
        │   └── logs/               # Simulated log data
        │       └── sample_logs.csv
        └── tests/                  # Shared Tests (simple)
            └── server_test.exs
