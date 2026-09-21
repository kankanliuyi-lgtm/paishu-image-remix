# Platform Output

These are practical defaults, not permanent platform guarantees. Recheck platform help before a campaign with strict specifications.

## Universal portrait default

Use a 3:4 portrait composition with a 1080 × 1440 final export when one asset should work on both Xiaohongshu and X.

- Keep the face, hands, and primary landmark inside the central safe area.
- Keep embedded text out of the image during style transfer.
- Prefer PNG for illustration and hard-edged graphics; prefer high-quality JPEG for painterly or photo-like results.
- Keep each final at or below 5 MB for broad compatibility with X image uploads.

X currently displays a single image in full for standard ratios from 2:1 through 3:4 and accepts JPEG, PNG, and GIF. Official reference: <https://help.x.com/en/using-x/posting-gifs-and-pictures>

Xiaohongshu does not expose an equally stable public specification page. Treat 1080 × 1440 as a creator-tested default and preview inside the app before publishing.

## Platform-specific variants

- `xiaohongshu`: Prefer 3:4, with enough clear area for a later headline overlay if the user requests a cover.
- `x`: A 3:4 single image is valid. Use a separately recomposed 1:1 image only when the user requests square output; do not center-crop a portrait if that would cut the head, hands, or landmark.
- `both`: Generate one crop-safe 3:4 master first. Create additional ratios only after visual review.

## Accessibility and disclosure

- For X, provide concise ALT text describing the subject, setting, style, and any meaningful visible text. Official reference: <https://help.x.com/en/using-x/add-image-descriptions>
- For China-facing publication, remind the user to use the platform's AI-generated-content declaration feature and do not remove provenance labels or metadata. Reference: <https://www.cac.gov.cn/2025-03/14/c_1743654684782215.htm>

## Validation

Run:

```bash
scripts/validate-social-image.sh <image> [<image> ...]
```

The script reports format, dimensions, ratio, byte size, whether the image is 3:4, and whether it is within the 5 MB X image limit. Visual inspection is still required.
