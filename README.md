<h1 align="center">PaiShu Image Remix</h1>

<h3 align="center">One photo. Eight styles. Identity intact.</h3>

<p align="center">
  Turn portraits and scenes into platform-ready visuals for Xiaohongshu and X while preserving the subject, pose, hands, clothing, and composition.
</p>

<p align="center">
  <a href="#install"><strong>Install</strong></a>
  &nbsp;&bull;&nbsp;
  <a href="#use-the-skill"><strong>Usage</strong></a>
  &nbsp;&bull;&nbsp;
  <a href="#the-eight-presets"><strong>Presets</strong></a>
  &nbsp;&bull;&nbsp;
  <a href="./README.zh-CN.md"><strong>简体中文</strong></a>
</p>

<p align="center">
  <a href="https://github.com/kankanliuyi-lgtm/paishu-image-remix/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/kankanliuyi-lgtm/paishu-image-remix?style=flat-square&color=FFD700"></a>
  <img alt="Agent Skills compatible" src="https://img.shields.io/badge/Agent%20Skills-compatible-111827?style=flat-square">
  <img alt="Presets" src="https://img.shields.io/badge/Presets-8-FF5A5F?style=flat-square">
</p>

## Eight styles at a glance

| **Soft Cel Editorial** | **Rounded 3D Character** | **Retro Pixel** | **Flat Social Illustration** |
| :---: | :---: | :---: | :---: |
| ![Soft Cel Editorial](assets/examples/01-soft-cel-editorial.png) | ![Rounded 3D Character](assets/examples/02-rounded-3d-character.png) | ![Retro Pixel](assets/examples/03-retro-pixel.png) | ![Flat Social Illustration](assets/examples/04-flat-social-illustration.png) |

| **Watercolor Journal** | **Pop Halftone Comic** | **Matte Clay** | **Neon Cyber** |
| :---: | :---: | :---: | :---: |
| ![Watercolor Journal](assets/examples/05-watercolor-journal.png) | ![Pop Halftone Comic](assets/examples/06-pop-halftone-comic.png) | ![Matte Clay](assets/examples/07-matte-clay.png) | ![Neon Cyber](assets/examples/08-neon-cyber.png) |

## What it does

PaiShu Image Remix is an Agent Skill for repeatable, identity-preserving image style transfer. Give it one portrait or scene and it can produce a single selected style, recommend a style for the content, or generate the complete eight-style comparison set.

- Preserves facial identity, apparent age, expression, hair, pose, hands, clothing, accessories, subject placement, and key background geometry.
- Uses eight tested presets with stable IDs and a fixed comparison order.
- Generates every style as a separate image instead of asking an image model to draw a low-quality collage.
- Reviews outputs for identity drift, broken hands, changed clothing, damaged landmarks, random text, logos, watermarks, and aspect-ratio drift.
- Allows at most one targeted automatic correction per asset.
- Defaults to a 3:4 portrait master that works well for both Xiaohongshu and X.

## Install

PaiShu Image Remix follows the open Agent Skills format. Install it globally with the [Skills CLI](https://github.com/vercel-labs/skills) (requires Node.js and npm):

```bash
npx skills add kankanliuyi-lgtm/paishu-image-remix -g
```

The installer detects compatible agents on your machine and lets you choose the target. You can also name an agent explicitly:

```bash
# Codex
npx skills add kankanliuyi-lgtm/paishu-image-remix -g -a codex -y

# Claude Code
npx skills add kankanliuyi-lgtm/paishu-image-remix -g -a claude-code -y

# Cursor
npx skills add kankanliuyi-lgtm/paishu-image-remix -g -a cursor -y

# Gemini CLI
npx skills add kankanliuyi-lgtm/paishu-image-remix -g -a gemini-cli -y

# GitHub Copilot
npx skills add kankanliuyi-lgtm/paishu-image-remix -g -a github-copilot -y
```

The CLI currently supports Codex, Claude Code, Cursor, Gemini CLI, GitHub Copilot, OpenCode, Cline, Windsurf, and many other Agent Skills-compatible tools. See the [complete supported-agent list](https://github.com/vercel-labs/skills#supported-agents).

For an Agent Skills-compatible product that is not handled by the CLI, clone or copy this repository into that product's documented skills directory. Keep `SKILL.md` at the root of the installed `paishu-image-remix` folder.

Verify that the repository is discoverable without installing it:

```bash
npx skills add kankanliuyi-lgtm/paishu-image-remix --list
```

After installation, restart the target agent. In Codex, you can invoke the skill explicitly with:

```text
$paishu-image-remix
```

In other agents, use the product's skill picker or ask it to use the `paishu-image-remix` skill. Invocation syntax varies by product.

## Use the skill

Generate the complete comparison set:

```text
Use the paishu-image-remix skill to turn this photo into the complete eight-style comparison. Preserve the subject's identity, pose, clothing, hands, and composition. Export 3:4 images for Xiaohongshu and X.
```

Generate one preset:

```text
Use the paishu-image-remix skill to transform this photo with the watercolor-journal preset. Use strict identity preservation, keep the original composition, and add no text.
```

Ask for a recommendation:

```text
Use the paishu-image-remix skill to recommend the best preset for this photo and create a platform-ready result for Xiaohongshu.
```

## The eight presets

| Preset ID | Display name | Best for |
| --- | --- | --- |
| `soft-cel-editorial` | Soft Cel Editorial | Lifestyle, travel, portraits |
| `rounded-3d-character` | Rounded 3D Character | Personal brands, avatars, approachable visuals |
| `retro-pixel` | Retro Pixel | Technology, games, nostalgia |
| `flat-social-illustration` | Flat Social Illustration | Education, products, explainers |
| `watercolor-journal` | Watercolor Journal | Travel, food, reflective storytelling |
| `pop-halftone-comic` | Pop Halftone Comic | Opinions, launches, bold posts |
| `matte-clay` | Matte Clay | Playful storytelling, handcrafted brands |
| `neon-cyber` | Neon Cyber | AI, software, technology, night scenes |

The full prompt recipes and avoid lists live in [`references/style-presets.md`](references/style-presets.md).

## How it works

1. Inspect the edit target at useful resolution.
2. Identify identity anchors, pose, hands, clothing, foreground, background landmarks, light direction, and aspect ratio.
3. Build the prompt from shared invariants plus exactly one preset recipe.
4. Generate each requested style independently.
5. Review identity, hands, clothing, composition, forbidden elements, and style strength.
6. Save stable filenames and validate platform output when needed.

See [`SKILL.md`](SKILL.md) for the complete operating instructions.

## Output defaults

- Shared Xiaohongshu/X master: 3:4 portrait, approximately 1080 × 1440.
- Keep the face, hands, and key landmark inside the central safe area.
- Do not generate headlines or captions inside the image during style transfer.
- Prefer PNG for graphic and hard-edged styles; use high-quality JPEG for painterly or photo-like output when appropriate.
- Keep files at or below 5 MB for broad X compatibility.
- Follow each platform's AI-generated-content disclosure requirements when publishing.

The optional [`scripts/validate-social-image.sh`](scripts/validate-social-image.sh) helper checks dimensions, ratio, and file size using macOS `sips`.

## Repository layout

```text
paishu-image-remix/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── assets/
│   ├── examples/
│   │   └── 01-...png through 08-...png
│   └── style-board.png
├── references/
│   ├── platform-output.md
│   └── style-presets.md
└── scripts/
    └── validate-social-image.sh
```

## Contributing

Bug reports, preset ideas, documentation improvements, and tested prompt refinements are welcome. Open an issue before proposing a broad workflow change so the behavior and compatibility goals stay clear.

## License

No open-source license has been selected yet. Unless a license is added, all rights are reserved by the repository owner.
