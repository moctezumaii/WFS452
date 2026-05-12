# scenario_05 audit and fix notes

## Scenario summary
- Reviewed files: `scennario_overview_5.qmd`, `scennario_overview_5.pdf`, `walleye_creel.csv`, `walleye_gillnet.csv`, `walleye_stocking.csv`
- Storyline review: Walleye harvest-management scenario with creel, gill-net, and stocking datasets; no dedicated environmental covariate file and no invasive carp storyline.

## Data tables discovered
- `walleye_creel.csv`: 2903 rows x 13 columns
- `walleye_gillnet.csv`: 1107 rows x 9 columns
- `walleye_stocking.csv`: 6 rows x 6 columns

## CSV parsing issues found and fixed
- Removed comma-containing comment blocks from every scenario CSV so the files now contain only the tabular header row plus data rows.
- Preserved the removed dataset notes and column descriptions in the "Moved CSV header notes" section below.
- Result: standard CSV readers can ingest these files without inconsistent field-count warnings caused by descriptive header text.

## Environmental covariate correlation review
- Audit note: No dedicated environmental covariate dataset is included in this scenario.
- Before:
- No dedicated environmental covariate dataset in this scenario.
- After:
- No dedicated environmental covariate dataset in this scenario.

## Invasive carp effect review
- No invasive carp component is included in this scenario.

## Remaining concerns / could not determine
- CSV data dictionaries were moved from the raw files into this note so the CSVs stay parser-safe.
- Scenario PDFs were not regenerated in this update, so the authoritative edited text is in the `.qmd` files and this note.

## Moved CSV header notes
### `walleye_creel.csv`

- walleye_creel.csv
- Lake Sandhill - Walleye Creel Survey Data
- Columns:
- year: Survey year (integer, YYYY)
- season: Fishing season (character: open_water or ice)
- month: Month of interview (integer, 1-12)
- survey_date: Date of creel clerk interview (YYYY-MM-DD)
- angler_id: Anonymous angler identifier (character)
- party_size: Number of anglers in the party
- hours_fished: Total hours fished by the party during that trip
- walleye_caught: Number of walleye caught (kept + released)
- walleye_harvested: Number of walleye harvested (kept)
- largest_walleye_mm: Total length of largest walleye caught in mm; NA if none caught
- target_species: Primary species targeted (character)
- satisfaction: Trip satisfaction (1=very dissatisfied to 5=very satisfied); NA if not answered
- resident: Whether angler is a local resident (yes or no); NA if not answered
- Units: effort in hours, length in mm
- Missing values coded as NA

### `walleye_gillnet.csv`

- walleye_gillnet.csv
- Lake Sandhill - Walleye Standardized Fall Gill Net Survey Data
- Columns:
- year: Survey year (integer, YYYY)
- sample_date: Date gill net was set (YYYY-MM-DD)
- site: Net site identifier (character, GN01-GN08)
- net_length_m: Total length of gill net in meters
- set_duration_hr: Hours the net was set
- fish_id: Unique fish identifier (character)
- total_length_mm: Total length of walleye in millimeters
- weight_g: Weight in grams; NA if not weighed
- cpue_per_net: Number of walleye per net night for that site-year
- Units: net length in m, duration in hours, length in mm, weight in g
- Missing values coded as NA

### `walleye_stocking.csv`

- walleye_stocking.csv
- Lake Sandhill - Walleye Stocking Records
- Columns:
- year: Year of stocking event (integer, YYYY)
- stocking_date: Date of stocking (YYYY-MM-DD)
- number_stocked: Total number of walleye fingerlings stocked
- mean_length_mm: Mean total length of stocked fingerlings in mm
- strain: Walleye strain used (character)
- source_hatchery: Name of source hatchery (character)
- Units: length in mm
- Missing values coded as NA

