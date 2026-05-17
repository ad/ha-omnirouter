# OmniRoute — Home Assistant Add-on

[OmniRoute](https://github.com/diegosouzapw/OmniRoute) is a free, open-source AI gateway: one endpoint, 160+ providers, smart auto-fallback, OpenAI-compatible API, and a built-in dashboard.

This add-on wraps the upstream `diegosouzapw/omniroute` Docker image so you can run it directly from Home Assistant Supervisor.

## Architectures

- `amd64`
- `aarch64`

(Upstream image is published only for these two; `armv7`/`armhf` are not supported.)

## Installation

1. Add this repository to Home Assistant: **Settings → Add-ons → Add-on Store → ⋮ → Repositories** → paste `https://github.com/ad/ha-omnirouter`.
2. Install **OmniRoute** from the store.
3. Start the add-on, then open the **Web UI** to access the dashboard.

## Options

| Option | Default | Description |
| --- | --- | --- |
| `port` | `20128` | API + dashboard port. |
| `dashboard_port` | `0` | If non-zero, runs the dashboard on a separate port (split-port mode). `0` = combined mode. |

## Data

Persistent data (database, providers, settings) is stored in `/share/omniroute` on the Home Assistant host, so it survives add-on updates and is accessible from other add-ons.

## Endpoints

- Dashboard: `http://<HA-IP>:20128/`
- OpenAI-compatible API: `http://<HA-IP>:20128/v1`
- MCP / A2A: see [OmniRoute docs](https://github.com/diegosouzapw/OmniRoute).

## Configuration (API keys, providers, combos)

All provider configuration is done from the dashboard UI on first launch. Nothing else is exposed via add-on options.
