# DeFi TVL Explorer

This project analyzes Total Value Locked (TVL) growth for eight DeFi protocols (Uniswap, Aave, Maple, Compound, Lido, EigenLayer, Curve, Ethena) from Q1 2024 to Q1 2025 to identify the fastest-growing protocol. Following the Google Data Analytics framework (Ask, Prepare, Process, Analyze, Share, Act), it uses Python, Google Sheets, BigQuery, R, and Tableau to deliver actionable insights for DeFi investors.

## Key Findings
- **Ethena** led with 1083.8% TVL growth, driven by its yield-bearing USDe stablecoin and institutional investments.
- **Uniswap** remained stable (1.57% growth), reflecting its dominance as a decentralized exchange.
- **Lido** saw a 9.71% TVL decline, likely due to a Bybit hack and competition from EigenLayer.

## Tools and Deliverables
- **Python**: Fetched TVL data from DeFiLlama (`defi_tvl_fetch.ipynb`).
- **Google Sheets**: Cleaned data (`cleaned_defi_tvl_data.csv`).
- **BigQuery**: Calculated growth percentages (`tvl_growth_results.csv`, `tvl_growth.sql`).
- **R**: Created visualizations (`tvl_trends_line_plot.png`, `tvl_growth_bar_plot.png`) via `tvl_analysis.R`.
- **Tableau**: Built an interactive dashboard ([Tableau Dashboard](https://public.tableau.com/views/DeFiTVLExplorer/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)).
- **R Markdown**: Compiled analysis and insights (`tvl_report.Rmd`, `tvl_report.html`).

## Repository Contents
- Data: `defi_tvl_data.csv`, `cleaned_defi_tvl_data.csv`, `tvl_growth_results.csv`
- Scripts: `defi_tvl_fetch.ipynb`, `tvl_growth.sql`, `tvl_analysis.R`
- Visualizations: `tvl_trends_line_plot.png`, `tvl_growth_bar_plot.png`
- Dashboard: `DeFiTVLExplorer.twbx`
- Report: `tvl_report.Rmd`, `tvl_report.html`
- Logs: `data_cleaning_log.txt`, `analysis_notes.txt`

Explore the full analysis in the [R Markdown report](tvl_report.html) or interact with the [Tableau Dashboard](https://public.tableau.com/views/DeFiTVLExplorer/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

