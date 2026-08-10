# Python analysis workflow

The repository preserves the notebooks produced by different team members and environments. Those notebooks are useful collaboration evidence, but their database assumptions diverged during the project. The reproducible entry point is now [`reproducible_analysis.ipynb`](reproducible_analysis.ipynb), which reads only checked-in CSV snapshots and requires no database credentials.

## Quick start

From the repository root:

```bash
python -m venv .venv
```

Activate the environment using the command for your shell, then run:

```bash
python -m pip install -r requirements.txt
python scripts/validate_project.py
jupyter notebook src/reproducible_analysis.ipynb
```

The canonical notebook locates the repository root at runtime, loads the authoritative datasets, reproduces the headline descriptive metrics, and calculates the genre-level subscriber affinity comparison used by the final dashboard.

## Notebook status

| Notebook | Status | Notes |
|---|---|---|
| `reproducible_analysis.ipynb` | Canonical | CSV-only, deterministic paths, no hidden database dependency. |
| `data_cleaning.ipynb` | Transformation provenance | Documents movie normalization and creates the movie/genre processed files. Run from `src/` if regenerating its outputs. |
| `device_distribution_visualizations.ipynb` | Historical/exploratory with CSV fallback | SQL extraction used SQL Server, but later cells can load the committed `device_distribution_*.csv` extracts. |
| `movie_genre_analysis.ipynb` | Historical/exploratory | Executed against local SQL Server and contains in-notebook package installation. Its committed CSV outputs are preserved as derived artifacts. |
| `User Distribution by Age Group Visualisation.ipynb` | Historical/exploratory | Originally executed against MySQL. The connection now requires the `STREAMFLIX_DATABASE_URL` environment variable; no credential is stored in the notebook. |
| `user_subscription_status_distribution.ipynb` | Historical/exploratory | Executed against a local SQL Server database named `DataLens`; the canonical notebook reproduces the subscription counts from `Users.csv`. |

Do not install packages from inside notebooks when reproducing the project. Use `requirements.txt` so the environment is explicit and reviewable.

## Optional MySQL connection

The canonical analysis does not need a live database. If a historical MySQL notebook is required, set a SQLAlchemy URL locally instead of editing credentials into the file:

```text
STREAMFLIX_DATABASE_URL=<your local SQLAlchemy connection URL>
```

Keep the value in your shell or an untracked `.env` file. Never commit it.
