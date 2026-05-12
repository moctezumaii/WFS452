# scenario_03 audit and fix notes

## Scenario summary
- Reviewed files: `scenario_overview_3.qmd`, `scenario_overview_3.pdf`, `crappie_harvest_survey.csv`, `crappie_length_frequency.csv`
- Storyline review: Black crappie size-structure scenario with length-frequency and harvest survey datasets; no dedicated environmental covariate file and no invasive carp storyline.

## Data tables discovered
- `crappie_harvest_survey.csv`: 1097 rows x 9 columns
- `crappie_length_frequency.csv`: 2296 rows x 7 columns

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
- Common carp appear only as background community context in the narrative; there is no invasive-carp dataset or intended invasive-carp analysis in this scenario.

## Remaining concerns / could not determine
- CSV data dictionaries were moved from the raw files into this note so the CSVs stay parser-safe.
- Scenario PDFs were not regenerated in this update, so the authoritative edited text is in the `.qmd` files and this note.

## Moved CSV header notes
### `crappie_harvest_survey.csv`

- crappie_harvest_survey.csv
- Silver Creek Impoundment - Black Crappie Voluntary Creel/Harvest Survey Data
- Columns:
- year: Year of survey (integer, YYYY)
- month: Month of survey (integer, 1-12)
- survey_date: Date of creel clerk interview (YYYY-MM-DD)
- angler_id: Anonymous angler identifier (character)
- hours_fished: Hours spent fishing during that trip
- crappie_caught: Total black crappie caught (kept + released)
- crappie_harvested: Number of black crappie kept/harvested
- largest_fish_mm: Length of largest crappie caught in mm; NA if no fish caught
- satisfaction: Angler satisfaction rating (1=very dissatisfied to 5=very satisfied); NA if not answered
- Units: effort in hours, length in mm
- Missing values coded as NA

### `crappie_length_frequency.csv`

- crappie_length_frequency.csv
- Silver Creek Impoundment - Black Crappie Fall Trap Net Length-Frequency Data
- Columns:
- year: Year of sampling (integer, YYYY)
- sample_date: Date of sampling (YYYY-MM-DD)
- site: Trap net site identifier (character, TN01-TN08)
- fish_id: Unique fish identifier (character)
- total_length_mm: Total length in millimeters
- weight_g: Weight in grams; NA if not weighed
- sex: Sex of fish (M, F, or U for unknown); NA if not determined
- Units: length in mm, weight in g
- Missing values coded as NA

