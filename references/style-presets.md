# Style Presets

Use the shared invariant block first, then append exactly one preset recipe. Keep the user's subject and scene separate from the style description.

## Shared invariant block

```text
The input image is the only edit target. Change only the visual medium and rendering language. Preserve the subject's identity, apparent age, face shape, expression, hair, body proportions, pose, hands, clothing, accessories, placement, main background landmarks, lighting direction, and original composition. Apply one coherent style to the entire frame. No new people, objects, limbs, fingers, text, logos, watermarks, borders, collages, or split screens.
```

Strength meanings:

- `subtle`: Keep realistic anatomy, textures, and lighting; introduce only light stylistic surface treatment.
- `balanced`: Make the medium clearly visible while keeping identity and scene structure stable.
- `bold`: Push palette, line, texture, and material strongly; still preserve the requested invariants.

## `soft-cel-editorial` — 柔和手绘动画

Best for lifestyle, travel, portraits, and calm storytelling. Default priority: high.

```text
Fine natural hand-drawn contours, restrained cel-shaded light and shadow, bright low-saturation natural colors, subtle paper texture, warm cinematic light, clear but not photorealistic environmental detail. Quiet, fresh, editorial travel-diary feeling. Do not imitate any specific animation studio or known character.
```

Avoid glossy plastic skin, oversized anime eyes, childish proportions, or generic fantasy scenery.

## `rounded-3d-character` — 圆润电影感 3D

Best for approachable personal brands, avatars, and polished lifestyle visuals. Default priority: medium.

```text
Unmistakable high-end animated feature-film CG, not a retouched photograph. Preserve the subject's adult identity and personal eye, nose, mouth, and face shapes, but rebuild every visible surface with clean sculpted geometry: simplified facial planes, smooth modeled skin with soft subsurface scattering instead of pores, groomed 3D hair locks, modeled lashes, and thick three-dimensional cloth folds. Render the complete environment as a coherent miniature CG world with beveled architecture, modeled foliage, volumetric clouds, physically rendered water, cinematic global illumination, shallow depth of field, and warm rim light. Use bold style strength while keeping the original pose, framing, and scene layout.
```

Avoid photographic skin, live-action camera realism, toy packaging, chibi proportions, oversized heads or eyes, waxy skin, and generic doll faces.

## `retro-pixel` — 复古像素

Best for technology, games, nostalgia, and playful X posts. Default priority: specialist.

```text
Detailed 32-bit pixel art with a clearly visible pixel grid, limited warm palette, intentional dithering, stepped edges, and enough pixel resolution to preserve facial identity, clothing, and architecture. Preserve adult body proportions and the original spatial layout.
```

Avoid game UI, score counters, text, extremely low-resolution blobs, or unrelated sprites.

## `flat-social-illustration` — 扁平社媒插画

Best for education, product explainers, clean personal brands, and social covers. Default priority: high.

```text
Premium flat editorial illustration with clean vector-like contours, simplified but accurate geometric color shapes, restrained soft shadows, disciplined palette, clear foreground-background hierarchy, and recognizable simplified facial features.
```

Avoid generic iconography, corporate clip-art figures, tiny decorative symbols, and text.

## `watercolor-journal` — 水彩旅行手帐

Best for travel, food, lifestyle, architecture, and reflective storytelling. Default priority: high.

```text
Transparent watercolor glazing, naturally feathered edges, delicate pencil underdrawing, cool-warm color transitions, preserved paper white, and controlled fine-brush facial details. Architecture may loosen slightly, but landmark identity and spatial relationships must stay accurate.
```

Avoid children's coloring-book treatment, muddy color mixing, illegible faces, or excessive blank paper.

## `pop-halftone-comic` — 波普网点漫画

Best for bold opinions, launches, announcements, and high-contrast X imagery. Default priority: medium.

```text
Confident black ink contours, controlled high-saturation red-yellow-blue-cyan blocks, fine halftone dots, screen-print texture, and strong attractive light-shadow separation. Keep the subject recognizable and the environment structured.
```

Avoid speech bubbles, captions, sound effects, superhero emblems, franchise costumes, or random typography.

## `matte-clay` — 哑光黏土

Best for playful storytelling, approachable brands, and handcrafted visual identity. Default priority: specialist.

```text
Strong, unmistakable handmade stop-motion modeling clay across the complete person and environment; never apply clay only as a surface filter. Preserve the subject's adult identity and personal facial shapes while rebuilding the face, arms, hands, hair, clothing, and accessories as matte clay forms with visible fingerprints, tool marks, seams, pressed textures, and small hand-shaped irregularities. Sculpt hair as separate thick clay strands and clothing as layered clay sheets with substantial folds. Rebuild buildings, trees, clouds, water, and foreground objects as one coherent tabletop miniature set with warm studio lighting and shallow miniature depth of field. Use bold style strength while preserving the original pose, framing, and scene layout.
```

Avoid live-action skin or hair, photographic textures, plastic surfaces, toy boxes, oversized heads, simplified mitten hands, or generic figurine faces.

## `neon-cyber` — 赛博霓虹

Best for AI, software, technology, night scenes, and energetic X posts. Default priority: medium.

```text
Controlled blue-hour atmosphere, cyan and magenta neon reflections, wet stone and water highlights, precise anime-realistic line work, cinematic rim light, and preserved real-world architecture. Keep the face natural and recognizable.
```

Avoid weapons, armor, cybernetic implants, added billboards, fake glyphs, text, or replacing the city with an unrelated futuristic skyline.

## Selection discipline

For a comparison request, keep composition and preservation language identical across variants. Change only the preset recipe. Generate each variant separately so failures remain attributable to one recipe.
