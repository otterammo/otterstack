# Subgen (Whisper AI subtitles)

Subgen is a lightweight API service that generates subtitles using OpenAI Whisper models. This app is wired for CPU inference via `mccloud/subgen:cpu` and integrates with Bazarr using the WhisperAI provider.

## What you get

- Image: `mccloud/subgen:cpu`
- Model cache in `conf/models` (persisted)
- Reads media from `${MEDIA_PATH}/movies` and `${MEDIA_PATH}/tv`
- Shares the external Docker network `homelab`

## Quick start

1. Ensure `homelab/.env` has your media root:
	 - `MEDIA_PATH=/path/to/media`
	 - `PUID`, `PGID`, and `TZ` as desired
2. Review `apps/subgen/.env` (used by Compose):
	 - `SUBGENAI_DATA_FOLDER=./conf`
	 - `MODEL_PATH=${SUBGENAI_DATA_FOLDER}/models`
	 - `LOG_LEVEL=debug`
3. Configure `apps/subgen/conf/subgen.env` (used by the container):
	 - `WHISPER_MODEL=base` (good CPU default; try `small` or `medium` later)
4. Start it:
	 - From `homelab/apps/subgen`: bring up with Docker Compose.

## Paths and volumes

- `${MEDIA_PATH}/tv` → `/tv` (read-only in container)
- `${MEDIA_PATH}/movies` → `/movies` (read-only in container)
- `./conf/models` → `/subgen/models` (model cache)
- `./conf/subgen.env` → `/subgen/subgen.env` (container env)

Tip: Bazarr should use the same container paths (`/tv` and `/movies`) so the provider can access the files correctly.

## Bazarr integration (WhisperAI)

In Bazarr:

1. Settings → Subtitles → Providers → enable WhisperAI.
2. Base URL: use the container DNS name: `http://subgenai:PORT`.
	 - Find the port from `docker logs subgenai` (look for "listening"/"http") or probe common ports inside Bazarr.
3. Move WhisperAI higher in the provider order or temporarily disable others to test.
4. Set target languages (Movies and Series) and enable "Upgrade" if you want AI subs when existing ones are low quality.
5. Kick off a search: Wanted → Missing → Search All, or per-item → Subtitles → Search.

## Monitor progress

- Follow logs:
	- `docker logs -f subgenai`
	- `docker logs -f bazarr | egrep -i 'whisper|subgen|provider'`
- Resource usage: `docker stats subgenai bazarr`
- Watch for new `.srt`/`.vtt` files near your media.

## Troubleshooting

- Connection error in Bazarr:
	- Ensure both containers are on the `homelab` network.
	- Use `http://subgenai:PORT` (not localhost) for the Base URL.
	- If unsure of the port, check `docker logs subgenai` for the listen line.
- CUDA or GPU error on a CPU host:
	- You’re already on `mccloud/subgen:cpu`; if needed, add `TRANSCRIBE_DEVICE=cpu` in `conf/subgen.env` and recreate the container.
- "bad/missing audio track - cannot transcribe":
	- The file may lack a supported audio stream. Check with `ffprobe` and consider converting/extracting audio with `ffmpeg` or using a remuxed MKV.
- Permissions/path issues:
	- Verify `${MEDIA_PATH}` is correct and readable by the app’s `PUID/PGID`.
	- Ensure Bazarr and Subgen map media to the same in-container paths.

## Resources

- Subgen: https://github.com/McCloudS/subgen
- Whisper: https://github.com/openai/whisper
