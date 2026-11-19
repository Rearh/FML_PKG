#!/usr/bin/env python3
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RECIPES_DIR = ROOT / "recipes"
INDEX_FILE = ROOT / "repo.json"

repo = {}
for build_script in sorted(RECIPES_DIR.rglob("build.sh")):
    meta = {}
    for line in build_script.read_text(encoding="utf-8").splitlines()[:15]:
        if line.startswith("# "):
            parts = line[2:].split(":", 1)
            if len(parts) == 2:
                meta[parts[0].strip()] = parts[1].strip()
    name = meta.get("name") or build_script.parent.name
    version = meta.get("version", "0.1.0")
    repo[name] = {
        "version": version,
        "recipe": str(build_script.relative_to(ROOT))
    }

INDEX_FILE.write_text(json.dumps(repo, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
print(f"[+] Сгенерирован repo.json ({len(repo)} пакетов).")
