# Netdata

Netdata provides real-time performance monitoring for your system and containers with a powerful web dashboard. It helps visualize metrics such as CPU usage, memory, disk activity, network bandwidth, and more.

## Features

- Live system metrics in a web UI
- Historical data storage
- Health alarms and notifications
- Lightweight and efficient

## Configuration

- Configuration files are stored in `core/netdata/conf`
- Uses named volumes for persistence:
  - `netdataconfig`
  - `netdatalib`
  - `netdatacache`

## Resources

- [Official Docs](https://learn.netdata.cloud/docs/overview)
- [GitHub Repo](https://github.com/netdata/netdata)
