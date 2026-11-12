# grill-me-docs → to-spec (process notes)

Class workflow: **grill-me-docs** to stress-test requirements, then **to-spec** to produce an implementation-ready spec.

## Before (rough idea)

- Recreate Base Command–style siege game for IS543 Project 2 Option B  
- SwiftUI + some backend  
- Custom decks, shop, sieges, leaderboards  
- Many open questions: what is primary CRUD? currency model? save mid-siege? email on leaderboard? how many sieges for MVP?

## Grill outcomes (locked decisions)

| Topic | Decision |
|-------|----------|
| Primary CRUD | Custom **Star Card decks** (not card authoring, not unit decks) |
| Deck size | Drafts &lt; 24 OK; **Start Siege** needs active deck with exactly **24** |
| Shop | Spend currency to **unlock** ownership (not buy physical copies) |
| Starting economy | Starter unlock set; **0** starting currency |
| Star rewards | Fixed pots per star; **each star pays once** (first time earned) |
| Demo scope | May ship **one** siege with boosted pots; more sieges = stretch |
| Board | Schematic **4×4 + central base**; landscape hub + play |
| Hub | After login → Home; swipe left **Shop**, swipe right **Decks** |
| Identity | **Commander name** at signup; leaderboards show name not email |
| Persistence | **No** mid-siege save for MVP |
| Test seams | `SiegeEngine` + `ProgressionService` |
| Out | PvP, Stripe/IAP for class, AI content, full 50-siege campaign as required bar |

## After (to-spec artifact)

Final packaged sections live in **`PROJECT_SPEC.md`** (included in this PDF):

- Problem statement & solution  
- User stories  
- Implementation decisions (platform, modules, domain rules, data)  
- Testing decisions  
- Explicit out-of-scope list  

Living short form: **`project_rules.md`**. Data follow-through: **`DATA_DESIGN.md`** / **`course/erd.png`**.
