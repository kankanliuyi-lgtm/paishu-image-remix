---
name: paishu-image-remix
description: Transform uploaded portraits and scenes into repeatable, identity-preserving visual styles for Xiaohongshu and X using eight curated presets. Use for social-image style remixing, style comparisons, preset recommendations, and platform-ready image validation; do not use for text-only poster layout or ordinary photo retouching.
---

# PaiShu Image Remix

Create visually distinct social images without losing the source subject, pose, clothing, or composition.

## Modes

- **Single preset:** Apply one named preset to one or more source images.
- **Style comparison:** Produce separate variants of the same source. Never generate a grid as a substitute for the individual finals.
- **Recommendation:** Select a preset from the content and platform when the user has not chosen one.

The supported preset IDs are defined in [references/style-presets.md](references/style-presets.md). Read that file before generating or rewriting a style prompt. Use [assets/style-board.png](assets/style-board.png) only as a local visual index; do not copy its person or composition into unrelated work.

## Official eight-preset set

For a complete comparison demo, keep this stable order: `soft-cel-editorial`, `rounded-3d-character`, `retro-pixel`, `flat-social-illustration`, `watercolor-journal`, `pop-halftone-comic`, `matte-clay`, `neon-cyber`. The approved [style board](assets/style-board.png) is the visual baseline for style separation and intensity only; never treat its subject, pose, clothing, or location as generation instructions.

## Inputs

Identify these values from the request and source image:

- edit target image(s)
- platform: `xiaohongshu`, `x`, or `both`
- preset ID
- style strength: `subtle`, `balanced` (default), or `bold`
- identity priority: `strict`, `balanced` (default), or `free`
- exact elements to preserve or change

Ask a question only when a missing choice would materially change the result. Otherwise recommend a preset and proceed.

## Preset routing

- Lifestyle, travel, portrait: `soft-cel-editorial` or `watercolor-journal`
- Educational, product, clean personal brand: `flat-social-illustration`
- Bold opinion or launch visual: `pop-halftone-comic`
- Technology and future topics: `neon-cyber` or `retro-pixel`
- Playful character treatment: `rounded-3d-character` or `matte-clay`

If the user names a studio, franchise, brand, or known character style, translate it into visual attributes and use the nearest generic preset. Do not add protected characters, logos, costumes, or franchise-specific symbols.

## Workflow

1. Inspect every edit target at full useful resolution. Describe the identity anchors, pose, clothing, foreground, background landmarks, light direction, and aspect ratio.
2. Label image roles explicitly. The user's source photo is the **edit target**; a separate mood or style image is a **style reference**.
3. Read the selected recipe in `references/style-presets.md` and build a short prompt in this order: use case, edit target, preserved invariants, style recipe, strength, platform intent, forbidden changes.
4. Use the built-in image generation/editing tool. Issue one generation call per requested style or asset.
5. Repeat the invariants in every edit call. For `strict` identity, lock face shape, apparent age, hair, expression, body proportions, pose, hands, clothing, accessories, subject placement, and background geometry.
6. Do not add in-image text during the style test. Typography and social-card layout are separate production steps.
7. Inspect each result for identity drift, extra fingers or limbs, changed clothing, damaged landmarks, random text, logos, watermarks, and aspect-ratio drift.
8. Make at most one automatic targeted correction per asset. Change only the failed dimension; do not rewrite the whole creative brief. Ask before further retries.
9. Save project-bound finals with stable filenames: `<sequence>-<preset-id>.<ext>`. Keep the original input unchanged.
10. When platform export matters, read [references/platform-output.md](references/platform-output.md) and run `scripts/validate-social-image.sh` on the finals.

## Output contract

Return:

- the preset ID and human-readable name
- the final prompt or prompt set
- the saved image paths
- a concise quality assessment covering identity, hands, composition, and style strength
- platform notes and ALT text when requested

Do not publish, upload, or post the result to a social platform without an explicit user request. Preserve any AI provenance or labeling metadata present in the generated file.
