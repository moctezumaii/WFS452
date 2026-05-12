# scenario_01 audit and fix notes

## Scenario summary
- Reviewed files: `scenario overview_1.qmd`, `scenario-overview_1.pdf`, `bass_age_growth.csv`, `bass_electrofishing.csv`
- Storyline review: Bass population assessment scenario with fish population and age-growth datasets; no dedicated environmental covariate file and no invasive carp storyline.

## Data tables discovered
- `bass_age_growth.csv`: 212 rows x 10 columns
- `bass_electrofishing.csv`: 1422 rows x 8 columns

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
### `bass_age_growth.csv`

- bass_age_growth.csv
- Pine Bluff Reservoir - Largemouth Bass Age and Growth Data from Otolith Samples
- Columns:
- year_collected: Year the fish was collected (integer, YYYY)
- fish_id: Unique fish identifier (character)
- total_length_mm: Total length at capture in millimeters
- weight_g: Weight at capture in grams
- age_years: Estimated age from otolith reading in years
- length_at_age1_mm: Back-calculated total length at age 1 (mm); NA if not available
- length_at_age2_mm: Back-calculated total length at age 2 (mm); NA if fish age < 2
- length_at_age3_mm: Back-calculated total length at age 3 (mm); NA if fish age < 3
- length_at_age4_mm: Back-calculated total length at age 4 (mm); NA if fish age < 4
- length_at_age5_mm: Back-calculated total length at age 5 (mm); NA if fish age < 5
- Units: lengths in mm, weight in g, age in years
- Missing values coded as NA

### `bass_electrofishing.csv`

- bass_electrofishing.csv
- Pine Bluff Reservoir - Largemouth Bass Fall Electrofishing Survey Data
- Columns:
- year: Year of sampling (integer, YYYY)
- sample_date: Date of electrofishing run (YYYY-MM-DD)
- site: Sampling site identifier (character, e.g., S01-S08)
- effort_seconds: Electrofishing effort in seconds per run
- fish_id: Unique fish identifier within that run
- total_length_mm: Total length of individual fish in millimeters
- weight_g: Weight of individual fish in grams; NA if not weighed
- cpue_fish_per_hr: Catch per unit effort (fish per hour) for the site-year; same for all fish in a site-year
- Units: length in mm, weight in g, effort in seconds, CPUE in fish/hr
- Missing values coded as NA

