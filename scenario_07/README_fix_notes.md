# scenario_07 audit and fix notes

## Scenario summary
- Reviewed files: `scenario_overview_7.qmd`, `scenario_overview_7.pdf`, `hybrid_striped_bass_stocking.csv`, `reservoir_environment.csv`, `reservoir_fish_survey.csv`, `user_survey.csv`
- Storyline review: Urban reservoir scenario with fish survey, monthly environment, user survey, and hybrid striped bass stocking datasets.

## Data tables discovered
- `hybrid_striped_bass_stocking.csv`: 8 rows x 5 columns
- `reservoir_environment.csv`: 84 rows x 9 columns
- `reservoir_fish_survey.csv`: 985 rows x 9 columns
- `user_survey.csv`: 490 rows x 9 columns

## CSV parsing issues found and fixed
- Removed comma-containing comment blocks from every scenario CSV so the files now contain only the tabular header row plus data rows.
- Preserved the removed dataset notes and column descriptions in the "Moved CSV header notes" section below.
- Result: standard CSV readers can ingest these files without inconsistent field-count warnings caused by descriptive header text.

## Environmental covariate correlation review
- Audit note: Reviewed reservoir_environment.csv and corrected the seasonal surface-temperature pattern so midsummer remains the warmest period and temperatures stay ecologically plausible.
- Before:
- `reservoir_environment.csv` before: surface_temp_c vs surface_do_mg_l: r=-0.853 (n=84)
- After:
- `reservoir_environment.csv` after: surface_temp_c vs bottom_do_mg_l: r=-0.773 (n=84)

## Invasive carp effect review
- No invasive carp component is included in this scenario.

## Remaining concerns / could not determine
- CSV data dictionaries were moved from the raw files into this note so the CSVs stay parser-safe.
- Scenario PDFs were not regenerated in this update, so the authoritative edited text is in the `.qmd` files and this note.
- Surface temperature values were corrected for seasonal realism; downstream student analyses that relied only on month labels may show slightly different fitted coefficients.

## Moved CSV header notes
### `hybrid_striped_bass_stocking.csv`

- hybrid_striped_bass_stocking.csv
- Millstone Reservoir - Hybrid Striped Bass Stocking Records
- Columns:
- year: Year of stocking (integer, YYYY)
- stocking_date: Date fish were stocked (YYYY-MM-DD)
- number_stocked: Number of fish stocked
- mean_tl_mm: Mean total length of stocked fish in mm
- life_stage: Life stage at stocking (character: fingerling, phase_II, advanced)
- Units: length in mm
- Missing values coded as NA

### `reservoir_environment.csv`

- reservoir_environment.csv
- Millstone Reservoir - Monthly Environmental Monitoring Data
- Columns:
- year: Year of measurement (integer, YYYY)
- month: Month of measurement (integer, 5-10)
- sample_date: Date of measurement (YYYY-MM-DD)
- secchi_depth_m: Secchi disk depth in meters
- surface_temp_c: Surface water temperature in degrees Celsius
- surface_do_mg_l: Surface dissolved oxygen in mg/L
- bottom_do_mg_l: Bottom dissolved oxygen (at deepest point) in mg/L; NA if not measured
- chlorophyll_a_ug_l: Chlorophyll-a concentration in ug/L; NA if not measured
- algal_bloom: Whether a visible algal bloom was present (yes or no)
- Units: depth in m, temp in C, DO in mg/L, chl-a in ug/L
- Missing values coded as NA

### `reservoir_fish_survey.csv`

- reservoir_fish_survey.csv
- Millstone Reservoir - Annual Fall Fish Survey Data
- Columns:
- year: Year of survey (integer, YYYY)
- sample_date: Date of sampling (YYYY-MM-DD)
- gear: Sampling gear (character: electrofishing or gill_net)
- site: Site identifier (character, EF01-EF06 for electrofishing, GN01-GN06 for gill net)
- effort_units: Effort measure (seconds for electrofishing, net-nights for gill net)
- species: Common name of fish species (character)
- count: Number of individuals captured
- mean_tl_mm: Mean total length of captured individuals in mm; NA if fewer than 3 fish
- cpue: Catch per unit effort (fish/hr for electrofishing, fish/net-night for gill net)
- Units: length in mm, effort varies by gear
- Missing values coded as NA

### `user_survey.csv`

- user_survey.csv
- Millstone Reservoir - Biennial User Intercept Survey Data
- Columns:
- year: Survey year (integer, YYYY)
- survey_date: Date of interview (YYYY-MM-DD)
- respondent_id: Anonymous respondent identifier (character)
- user_type: Primary activity (character: angler, kayaker, swimmer, walker, other)
- frequency: How often they visit per month during season (integer)
- hours_on_site: Hours spent during that visit
- satisfaction: Overall satisfaction (1=very dissatisfied to 5=very satisfied); NA if not answered
- top_concern: Most important management concern selected from list (character)
- would_support_fee: Would support a small access fee for improvements (yes, no, unsure); NA if not answered
- Units: frequency in visits/month, time in hours
- Missing values coded as NA

