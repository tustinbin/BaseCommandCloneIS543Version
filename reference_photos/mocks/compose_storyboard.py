from PIL import Image, ImageDraw, ImageFont
from pathlib import Path

src = Path(__file__).resolve().parent
out = src / "vis-storyboard-flow.jpg"

frames = [
    ("vis-auth.jpg", "1. Auth"),
    ("vis-siege-home.jpg", "2. Siege Home"),
    ("vis-shop.jpg", "3. Shop (swipe left)"),
    ("vis-decks.jpg", "4. Decks (swipe right)"),
    ("vis-leaderboard.jpg", "5. Leaderboard"),
    ("vis-battlefield.jpg", "6. Battlefield"),
    ("vis-results.jpg", "7. Results"),
]

cols, rows = 4, 2
thumb_w, thumb_h = 640, 360
pad = 36
label_h = 44
header_h = 90
canvas_w = pad + cols * (thumb_w + pad)
canvas_h = header_h + rows * (thumb_h + label_h + pad) + pad

canvas = Image.new("RGB", (canvas_w, canvas_h), (24, 26, 32))
draw = ImageDraw.Draw(canvas)

try:
    font_title = ImageFont.truetype("arial.ttf", 36)
    font_label = ImageFont.truetype("arial.ttf", 22)
except OSError:
    font_title = ImageFont.load_default()
    font_label = font_title

draw.text((pad, 28), "Base Command Clone — Visual Storyboard", fill=(245, 245, 245), font=font_title)
draw.text(
    (pad, 68),
    "Landscape flow  |  white companion style  |  Shop <- Siege Home -> Decks",
    fill=(180, 180, 190),
    font=font_label,
)

positions = []
for i, (fname, label) in enumerate(frames):
    if i < 4:
        r, c = 0, i
        x = pad + c * (thumb_w + pad)
    else:
        r = 1
        c = i - 4
        x = pad + int((thumb_w + pad) * 0.5) + c * (thumb_w + pad)
    y = header_h + pad + r * (thumb_h + label_h + pad)
    positions.append((x, y, fname, label))


def rounded_paste(base, img, xy, radius=18):
    img = img.convert("RGBA").resize((thumb_w, thumb_h), Image.Resampling.LANCZOS)
    mask = Image.new("L", (thumb_w, thumb_h), 0)
    mdraw = ImageDraw.Draw(mask)
    mdraw.rounded_rectangle([0, 0, thumb_w, thumb_h], radius=radius, fill=255)
    shadow = Image.new("RGBA", (thumb_w + 12, thumb_h + 12), (0, 0, 0, 0))
    sdraw = ImageDraw.Draw(shadow)
    sdraw.rounded_rectangle(
        [6, 6, thumb_w + 6, thumb_h + 6], radius=radius, fill=(0, 0, 0, 110)
    )
    base.paste(shadow, (xy[0] - 4, xy[1] - 2), shadow)
    base.paste(img, xy, mask)


canvas_rgba = canvas.convert("RGBA")
for x, y, fname, label in positions:
    path = src / fname
    if not path.exists():
        continue
    im = Image.open(path)
    rounded_paste(canvas_rgba, im, (x, y))
    d = ImageDraw.Draw(canvas_rgba)
    d.text((x, y + thumb_h + 10), label, fill=(230, 200, 120), font=font_label)

d = ImageDraw.Draw(canvas_rgba)
arrow_color = (212, 175, 55, 255)


def arrow(x1, y1, x2, y2):
    d.line([(x1, y1), (x2, y2)], fill=arrow_color, width=4)
    d.polygon([(x2, y2), (x2 - 12, y2 - 8), (x2 - 12, y2 + 8)], fill=arrow_color)


for i in range(3):
    x1 = positions[i][0] + thumb_w + 4
    y1 = positions[i][1] + thumb_h // 2
    x2 = positions[i + 1][0] - 4
    arrow(x1, y1, x2, y1)

sx = positions[1][0] + thumb_w // 2
sy = positions[1][1] + thumb_h + label_h
bx = positions[5][0] + thumb_w // 2
by = positions[5][1] - 8
d.line([(sx, sy), (sx, sy + 20), (bx, by - 20), (bx, by)], fill=arrow_color, width=4)
d.polygon([(bx, by), (bx - 8, by - 12), (bx + 8, by - 12)], fill=arrow_color)

x1 = positions[5][0] + thumb_w + 4
y1 = positions[5][1] + thumb_h // 2
x2 = positions[6][0] - 4
arrow(x1, y1, x2, y1)

final = canvas_rgba.convert("RGB")
final.save(out, quality=92)
print("wrote", out, final.size)
