# Power BI source-control workflow

The repository already contains a Power BI Desktop Project, not only a binary report:

```text
reports/
  DataLens_Streaming_Final.pbip
  DataLens_Streaming_Final.Report/
    definition.pbir
    definition/                 # PBIR report JSON by page and visual
  DataLens_Streaming_Final.SemanticModel/
    definition.pbism
    definition/                 # TMDL semantic model
```

This makes the Git-native workflow the preferred development path for this repository. The legacy binary workflow remains a safe fallback when contributors must exchange a `.pbix` file or cannot use the preview project formats.

## Current Microsoft status

As of 10 August 2026, Microsoft's documentation still identifies Power BI Desktop Projects as a preview feature. PBIP saves report and semantic-model definitions as plain-text project files designed for source control and collaboration. See [Power BI Desktop projects](https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-overview) and [Git integration with Power BI Desktop projects](https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-git).

This project uses both enhanced formats:

- PBIR stores each page, visual, and other report object in separate JSON files, improving change tracking and conflict resolution. PBIR remains preview and has documented limitations. See the [Power BI project report folder and PBIR limitations](https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-report).
- TMDL stores semantic-model objects in readable files, including one file per table, to improve Git diffs and co-development. TMDL project storage remains preview. See the [Power BI project semantic model folder](https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-dataset) and [TMDL overview](https://learn.microsoft.com/en-us/analysis-services/tmdl/tmdl-overview).

Preview status does not make the files unusable, but it does mean the team should preserve review exports and validate every merged project in Power BI Desktop before publishing.

## Configure the data path

The semantic model reads the checked-in CSV snapshots through the Power Query parameter `DataRoot`. Its placeholder value is stored in:

```text
reports/DataLens_Streaming_Final.SemanticModel/definition/expressions.tmdl
```

On the first local open:

1. Open `reports/DataLens_Streaming_Final.pbip` in a current Power BI Desktop release with PBIP, PBIR, and TMDL preview features enabled.
2. Open **Transform data > Manage parameters**.
3. Set `DataRoot` to the absolute path of the repository's `data` directory on your machine.
4. Apply changes and refresh the model.
5. Save, then inspect the Git diff. The parameter is shared project metadata, so do not commit your personal path. Restore its placeholder before committing if Desktop writes the local value into `expressions.tmdl`.

The model deliberately loads `ratings_clean.csv`, not the raw ratings file, so the Power BI source matches the documented data contract.

## Git-native PBIP workflow

Use this mode for the checked-in PBIP/PBIR/TMDL project.

1. Sync `main` from `upstream` and create one feature branch per Jira task.
2. State the report objects you intend to own in the Jira issue or team channel. Prefer boundaries such as one report page, one visual, or one semantic-model table.
3. Open the PBIP, make the scoped change, refresh if data or Power Query changed, and save.
4. Review the Git diff before committing:
   - PBIR page/visual JSON should match the objects you changed;
   - TMDL changes should match the model objects you changed;
   - local cache or settings files must not be staged;
   - unexpected rewrites require investigation before commit.
5. Export a PDF or screenshot for visual review when presentation, formatting, or interactions changed.
6. Commit, push to the contributor fork, and open a PR to the team repository.
7. The reviewer inspects both the text diff and review export. Before merge or publish, open the merged PBIP in Power BI Desktop, refresh, and check the affected pages and interactions.

PBIR/TMDL make concurrent work practical; they do not make every edit conflict-free. Two contributors editing the same visual JSON, page metadata, relationship, measure, or table can still create a semantic conflict even when Git can merge the text. Coordinate ownership for overlapping objects and never resolve a conflict by choosing an entire side without understanding the report/model impact.

Microsoft notes that Power BI Desktop does not automatically reload external changes. Restart Desktop after changes made through Git, a code editor, or another tool. External edits can also block a project from opening if they violate the schema, so Desktop validation remains part of the merge gate.

## Legacy `.pbix` workflow

Use the handoff slot when the working artifact is a binary `.pbix` file, when a contributor cannot use PBIP, or when a preview-format limitation blocks the Git-native path.

1. Claim the slot in the team channel and Jira issue.
2. Sync and create a feature branch.
3. Edit the binary report in Power BI Desktop; no other contributor edits that same `.pbix` concurrently.
4. Export screenshots or a PDF for PR review.
5. Commit the binary and review assets, push, and open the PR.
6. Release the slot only after the file is saved, pushed, and handed off clearly.

Git cannot meaningfully merge a `.pbix` binary. The slot prevents last-writer-wins data loss and remains the correct fallback for binary work.

## Source-control exclusions

The root `.gitignore` excludes the Power BI files Microsoft identifies as local machine state:

```text
**/.pbi/localSettings.json
**/.pbi/cache.abf
```

`cache.abf` is a local cached model/data copy; `localSettings.json` can contain per-machine settings and protected security bindings. Neither belongs in a shared repository. Power BI Desktop can open a PBIP without the cache and then refresh from the configured source.

## Review checklist

- The branch contains only the intended report/model objects.
- All changed JSON parses and retains its `$schema` declaration.
- No `.pbi/cache.abf`, `.pbi/localSettings.json`, credential, or personal path is staged.
- `python scripts/validate_project.py` passes.
- The PBIP opens in Power BI Desktop after the final merge.
- A refresh completes against the configured `DataRoot`.
- Updated pages, slicers, interactions, DAX measures, and Power Query steps behave as intended.
- PDF/screenshots are re-exported when user-visible content changes.
- Preview limitations and any unvalidated behavior are stated in the PR.
