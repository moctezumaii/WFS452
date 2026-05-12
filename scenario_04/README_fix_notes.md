# scenario_04 audit and fix notes

## Scenario summary
- Reviewed files: `sceneario_overview_4.qmd`, `sceneario_overview_4.pdf`, `stream_habitat.csv`, `stream_temperature.csv`, `trout_population.csv`
- Storyline review: Coldwater trout and habitat assessment scenario with fish population, daily stream temperature, and habitat monitoring datasets.

## Data tables discovered
- `stream_habitat.csv`: 200 rows x 9 columns
- `stream_temperature.csv`: 4048 rows x 4 columns
- `trout_population.csv`: 1157 rows x 8 columns

## CSV parsing issues found and fixed
- Removed comma-containing comment blocks from every scenario CSV so the files now contain only the tabular header row plus data rows.
- Preserved the removed dataset notes and column descriptions in the "Moved CSV header notes" section below.
- Result: standard CSV readers can ingest these files without inconsistent field-count warnings caused by descriptive header text.

## Environmental covariate correlation review
- Audit note: Adjusted daily maximum stream temperatures to retain a strong but non-degenerate relationship with daily means while keeping downstream maxima slightly warmer and all values plausible.
- Before:
- `stream_temperature.csv` before: daily_mean_temp_c vs daily_max_temp_c: r=0.984 (n=3969)
- `stream_habitat.csv` before: canopy_cover_pct vs bank_erosion_rating: r=-0.433 (n=200)
- After:
- `stream_temperature.csv` after: daily_mean_temp_c vs daily_max_temp_c: r=0.973 (n=3969)
- `stream_habitat.csv` after: canopy_cover_pct vs bank_erosion_rating: r=-0.433 (n=200)

## Invasive carp effect review
- No invasive carp component is included in this scenario.

## Remaining concerns / could not determine
- CSV data dictionaries were moved from the raw files into this note so the CSVs stay parser-safe.
- Scenario PDFs were not regenerated in this update, so the authoritative edited text is in the `.qmd` files and this note.
- Daily mean and daily maximum temperatures remain strongly related by design, but no longer behave like near-duplicate covariates.

## Moved CSV header notes
### `stream_habitat.csv`

- stream_habitat.csv
- Elk Fork Creek - Stream Habitat Survey Data
- Columns:
- year: Year of survey (integer, YYYY)
- site: Site identifier (character, EF01-EF05)
- transect: Transect number within site (integer)
- canopy_cover_pct: Percent canopy cover overhead
- dominant_substrate: Dominant substrate type (character: bedrock, boulder, cobble, gravel, sand, silt)
- pct_fines: Percent substrate composed of sand and finer material
- pool_depth_cm: Maximum pool depth at the transect in centimeters; NA if no pool present
- lwd_count: Count of large woody debris pieces (>10 cm diameter, >1 m length) within 5 m of transect
- bank_erosion_rating: Visual rating of bank erosion (1=none to 5=severe)
- Units: cover in %, depth in cm, LWD as count
- Missing values coded as NA

### `stream_temperature.csv`

- stream_temperature.csv
- Elk Fork Creek - Daily Water Temperature from Two Monitoring Stations
- Columns:
- date: Date of measurement (YYYY-MM-DD)
- station: Station identifier (upstream or downstream)
- daily_mean_temp_c: Daily mean water temperature in degrees Celsius
- daily_max_temp_c: Daily maximum water temperature in degrees Celsius
- Units: temperature in Celsius
- Missing values coded as NA
- Temperature loggers deployed May through October each year

### `trout_population.csv`

- trout_population.csv
- Elk Fork Creek - Brown Trout Annual Electrofishing Survey Data
- Columns:
- year: Year of survey (integer, YYYY)
- sample_date: Date of electrofishing (YYYY-MM-DD)
- site: Stream site identifier (character, EF01-EF05)
- reach_length_m: Length of the sampled reach in meters
- fish_id: Unique fish identifier (character)
- total_length_mm: Total length in millimeters
- weight_g: Weight in grams; NA if not weighed
- cpue_per_100m: Site-level CPUE (fish per 100 m of stream); same for all fish at a site-year
- Units: length in mm, weight in g, reach in meters
- Missing values coded as NA

