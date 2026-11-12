"""Low-fidelity landscape wireframe storyboard — boxes + text only."""
from PIL import Image, ImageDraw, ImageFont
from pathlib import Path

OUT = Path(__file__).resolve().parent / "vis-storyboard-flow.jpg"

FW, FH = 280, 168
GAP_X, GAP_Y = 48, 56
MARGIN = 40
HEADER = 70
COLS, ROWS = 4, 2

SCREENS = [
    ("1", "AUTH", [
        "Email ________",
        "Password ____",
        "Commander ___",
        "",
        "[ Sign In ]",
        "Create Account",
    ]),
    ("2", "SIEGE HOME", [
        "Commander | Credits",
        "----------------",
        "Last: Tutorial Siege",
        "Stars: * * o",
        "",
        "[ Start Siege ]",
        "[ All Sieges ] [ Board ]",
        "",
        "o Shop  • Home  o Decks",
    ]),
    ("3", "SHOP (swipe left)", [
        "Credits: ####",
        "----------------",
        "[Card] [Card] [Card]",
        "[Card] [Locked]",
        "",
        "Selected: ----",
        "[ Unlock ]",
    ]),
    ("4", "DECKS (swipe right)", [
        "My Decks (n/10)",
        "----------------",
        "* Active  24/24",
        "o Draft   18/24",
        "o Deck C  24/24",
        "",
        "[ New ] [ Edit ] [ Del ]",
    ]),
    ("5", "ALL SIEGES", [
        "Siege List",
        "----------------",
        "> Tutorial   * * o",
        "  Locked 2",
        "  Locked 3",
        "",
        "[ Leaderboard ]",
    ]),
    ("6", "BATTLEFIELD", [
        "Menu  Score  HP  Enemies",
        "+------------------+",
        "|  [ 4x4 BOARD ]   |",
        "|  rings + base    |",
        "+------------------+",
        "Hand [U][U][U][S][S][S]",
        "[ End Turn ] Cannon",
    ]),
    ("7", "RESULTS", [
        "Victory / Defeat",
        "----------------",
        "Stars: * * o",
        "Score: #####",
        "Credits +: ###",
        "",
        "[ Continue ]",
    ]),
]


def load_font(size: int):
    for name in ("arial.ttf", "segoeui.ttf", "calibri.ttf"):
        try:
            return ImageFont.truetype(name, size)
        except OSError:
            continue
    return ImageFont.load_default()


def frame_origin(index: int) -> tuple[int, int]:
    if index < 4:
        c = index
        x = MARGIN + c * (FW + GAP_X)
        r = 0
    else:
        r = 1
        c = index - 4
        offset = (FW + GAP_X) // 2
        x = MARGIN + offset + c * (FW + GAP_X)
    y = HEADER + MARGIN + r * (FH + GAP_Y + 28)
    return x, y


def draw_phone_frame(draw, x, y, sid, title, lines, fonts):
    draw.rectangle([x, y, x + FW, y + FH], outline=(30, 30, 30), width=2, fill=(255, 255, 255))
    draw.rectangle([x, y, x + FW, y + 14], fill=(235, 235, 235), outline=(30, 30, 30), width=1)
    draw.text((x + 6, y + 1), f"{sid}  landscape", fill=(100, 100, 100), font=fonts["tiny"])
    draw.text((x + 8, y + 18), title, fill=(10, 10, 10), font=fonts["label"])
    draw.line([(x + 8, y + 34), (x + FW - 8, y + 34)], fill=(200, 200, 200), width=1)
    ty = y + 40
    for line in lines:
        draw.text((x + 10, ty), line, fill=(45, 45, 45), font=fonts["body"])
        ty += 13
        if ty > y + FH - 12:
            break
    draw.text((x, y + FH + 6), f"{sid}. {title}", fill=(60, 60, 60), font=fonts["caption"])


def arrow(draw, x1, y1, x2, y2):
    draw.line([(x1, y1), (x2, y2)], fill=(80, 80, 80), width=2)
    draw.polygon([(x2, y2), (x2 - 8, y2 - 5), (x2 - 8, y2 + 5)], fill=(80, 80, 80))


def main():
    fonts = {
        "title": load_font(28),
        "sub": load_font(14),
        "label": load_font(12),
        "body": load_font(11),
        "tiny": load_font(9),
        "caption": load_font(11),
    }

    width = MARGIN * 2 + COLS * FW + (COLS - 1) * GAP_X
    height = HEADER + MARGIN * 2 + ROWS * FH + (ROWS - 1) * (GAP_Y + 28) + 40

    img = Image.new("RGB", (width, height), (250, 250, 250))
    draw = ImageDraw.Draw(img)

    draw.text((MARGIN, 18), "Base Command Clone — Low-Fi Storyboard", fill=(20, 20, 20), font=fonts["title"])
    draw.text(
        (MARGIN, 48),
        "Landscape wireframes  ·  Shop ← Siege Home → Decks  ·  shapes + text only",
        fill=(90, 90, 90),
        font=fonts["sub"],
    )

    origins = [frame_origin(i) for i in range(len(SCREENS))]
    for i, (sid, title, lines) in enumerate(SCREENS):
        x, y = origins[i]
        draw_phone_frame(draw, x, y, sid, title, lines, fonts)

    # Auth -> Siege Home
    arrow(
        draw,
        origins[0][0] + FW + 4,
        origins[0][1] + FH // 2,
        origins[1][0] - 4,
        origins[1][1] + FH // 2,
    )

    # Home -> Shop (swipe)
    mid = origins[1][1] + FH // 2
    arrow(draw, origins[1][0] + FW + 4, mid - 8, origins[2][0] - 4, origins[2][1] + FH // 2 - 8)
    draw.text((origins[1][0] + FW + 6, mid - 24), "swipe", fill=(110, 110, 110), font=fonts["tiny"])

    # Shop -> Decks label as pager siblings
    arrow(
        draw,
        origins[2][0] + FW + 4,
        origins[2][1] + FH // 2 + 8,
        origins[3][0] - 4,
        origins[3][1] + FH // 2 + 8,
    )

    # Home -> All Sieges
    sx = origins[1][0] + FW // 2 - 36
    sy = origins[1][1] + FH + 22
    ax = origins[4][0] + FW // 2
    ay = origins[4][1] - 4
    draw.line([(sx, sy), (sx, sy + 8), (ax, ay - 10), (ax, ay)], fill=(80, 80, 80), width=2)
    draw.polygon([(ax, ay), (ax - 5, ay - 8), (ax + 5, ay - 8)], fill=(80, 80, 80))
    draw.text((min(sx, ax) + 4, sy), "All Sieges", fill=(110, 110, 110), font=fonts["tiny"])

    # Home -> Battlefield (Start)
    hx = origins[1][0] + FW // 2 + 20
    hy = origins[1][1] + FH + 22
    bx = origins[5][0] + FW // 2
    by = origins[5][1] - 4
    draw.line([(hx, hy), (hx, hy + 10), (bx, by - 12), (bx, by)], fill=(80, 80, 80), width=2)
    draw.polygon([(bx, by), (bx - 5, by - 8), (bx + 5, by - 8)], fill=(80, 80, 80))
    draw.text((hx + 4, hy), "Start", fill=(110, 110, 110), font=fonts["tiny"])

    # Battlefield -> Results
    arrow(
        draw,
        origins[5][0] + FW + 4,
        origins[5][1] + FH // 2,
        origins[6][0] - 4,
        origins[6][1] + FH // 2,
    )
    draw.text(
        (origins[5][0] + FW + 6, origins[5][1] + FH // 2 - 14),
        "end",
        fill=(110, 110, 110),
        font=fonts["tiny"],
    )

    draw.rectangle(
        [MARGIN, height - 36, width - MARGIN, height - 12],
        outline=(180, 180, 180),
        fill=(255, 255, 255),
    )
    draw.text(
        (MARGIN + 8, height - 32),
        "Lo-fi only. Hub: swipe left = Shop, center = Siege Home, swipe right = Decks. Leaderboard = modal from siege screens.",
        fill=(70, 70, 70),
        font=fonts["sub"],
    )

    img.save(OUT, quality=95)
    print("wrote", OUT, img.size)


if __name__ == "__main__":
    main()
