# Power BI Build Guide — IT Services Dashboard

Step-by-step instructions to build the dashboard from scratch on a Mac.

---

## Prerequisites

Power BI Desktop does not run natively on macOS. Use one of these:

**Option A — Microsoft Cloud (easiest, free)**
1. Go to app.powerbi.com → sign in with a free Microsoft account
2. Use Power BI Service (browser-based) — limited features but workable

**Option B — Parallels Desktop (recommended for full feature access)**
1. Install [Parallels Desktop](https://www.parallels.com/) (~$100/year)
2. Install Windows 11 ARM inside Parallels
3. Download Power BI Desktop from microsoft.com/en-us/power-bi/downloads — it's free
4. Full desktop experience with all DAX, bookmarks, drill-through, custom visuals

**Option C — VMware Fusion (free for personal use)**
1. Download VMware Fusion Player (free)
2. Install Windows 11 ARM
3. Install Power BI Desktop

> For a analytics project, Option B gives the best result. Parallels trial is 14 days free.

---

## Step 1 — Load Data

1. Open Power BI Desktop → click **Get Data** → **Excel Workbook**
2. Navigate to `data/IT_Services_Dashboard_Dataset.xlsx`
3. In the Navigator pane, select ALL sheets:
   - `Annual_Revenue`
   - `Quarterly_Revenue`
   - `Profitability`
   - `Workforce_Attrition`
   - `Cloud_AI_Digital`
   - `Geographic_Revenue`
4. Click **Transform Data** (do not click Load yet)

---

## Step 2 — Power Query Cleanup

In the Power Query Editor, for each table:

1. **Promote headers**: Home → Use First Row as Headers (if not auto-detected)
2. **Fix data types**:
   - FY columns → Text (not number — avoids "2,020" formatting)
   - Revenue columns → Decimal Number
   - Percentage columns → Percentage (divide by 100 if stored as 15.0 instead of 0.15)
   - Employee counts → Whole Number
3. **Remove Notes column** from all tables before loading (optional — keeps model clean)
4. **Rename tables** to clean names: `Annual_Revenue`, `Profitability`, etc.

Click **Close & Apply**.

---

## Step 3 — Create Dimension Tables

In Power BI Desktop → Home → Enter Data, create two dimension tables manually:

**Dim_Company**
| Company | Ticker | Exchange | HQ | Founded |
|---|---|---|---|---|
| TCS | TCS.NS | NSE | Mumbai | 1968 |
| Infosys | INFY | NYSE/NSE | Bengaluru | 1981 |
| Wipro | WIT | NYSE/NSE | Bengaluru | 1945 |
| HCL Tech | HCLTECH.NS | NSE | Noida | 1976 |
| Accenture | ACN | NYSE | Dublin | 1989 |

**Dim_FY**
| FY | FY_Label | Is_Estimate | Sort_Order |
|---|---|---|---|
| FY2020 | FY20 | No | 1 |
| FY2021 | FY21 | No | 2 |
| FY2022 | FY22 | No | 3 |
| FY2023 | FY23 | No | 4 |
| FY2024 | FY24 | No | 5 |
| FY2025E | FY25E | Yes | 6 |

---

## Step 4 — Build Relationships (Model View)

Click the **Model** icon (left sidebar). Drag and connect:

```
Dim_Company[Company]  →  Annual_Revenue[Company]       (1:Many)
Dim_Company[Company]  →  Profitability[Company]         (1:Many)
Dim_Company[Company]  →  Workforce_Attrition[Company]  (1:Many)
Dim_Company[Company]  →  Cloud_AI_Digital[Company]     (1:Many)
Dim_Company[Company]  →  Geographic_Revenue[Company]   (1:Many)
Dim_FY[FY]           →  Annual_Revenue[FY]             (1:Many)
Dim_FY[FY]           →  Profitability[FY]              (1:Many)
Dim_FY[FY]           →  Workforce_Attrition[FY]        (1:Many)
Dim_FY[FY]           →  Cloud_AI_Digital[FY]           (1:Many)
```

Cross-filter direction: **Single** for all (Dim → Fact direction only).

---

## Step 5 — Create Measures Table

Home → Enter Data → create a blank table called `_Measures` with one column `Placeholder` and one row of text "delete me".

Load it, then delete that row. This becomes your central measure store — a Power BI best practice.

---

## Step 6 — Add DAX Measures

Right-click `_Measures` table → New Measure. Add each measure from the `/dax/` folder.

Start with these foundational measures:

```dax
Total Revenue = SUM(Annual_Revenue[Revenue_USD_M])
```

```dax
Total Net Profit = SUM(Profitability[Net_Profit_M])
```

```dax
Total Employees = SUM(Workforce_Attrition[Total_Employees])
```

Then add derived measures (see full list in `/dax/all-measures.dax`).

---

## Step 7 — Apply Corporate Theme

1. View tab → Themes → Browse for themes
2. Load `assets/theme.json`
3. This sets the background, font, and color palette across all pages

---

## Step 8 — Build Each Page

### Canvas Setup
- File → Options → Report settings → Canvas size: 1366 × 768

### Page 1 — Executive Summary

**Layout:**
```
[Nav panel 80px left] | [KPI row — 6 cards, full width] 
                      | [Revenue trend line 65%] [Market share donut 35%]
                      | [EBIT margin bars 65%]   [Insights panel 35%]
```

**Visuals to add:**
1. Six KPI cards — use Card visual, one per metric
2. Line chart — X: FY, Y: Revenue, Legend: Company
3. Donut chart — Values: Revenue, Legend: Company
4. Clustered bar — Revenue trend with company filter
5. Text box for insights section

### Page 2 — Company Comparison

**Layout:**
```
[Grouped bar — Revenue by FY]    [Net margin horizontal bars]
[Metrics scorecard table]
[CAGR comparison chart]
```

**Key visual:** Matrix visual for scorecard — rows: Company, columns: Metric, values: DAX measures.

### Page 3 — Workforce & Attrition

**Layout:**
```
[KPI row — 6 cards]
[Headcount line chart]     [Attrition line chart]
[Rev/Employee bar]         [Workforce insights]
```

### Page 4 — Cloud & Digital

**Layout:**
```
[KPI row — 6 cards]
[Cloud revenue line chart]     [Cloud % horizontal bars]
[AI/Digital grouped bar — full width]
```

### Page 5 — Forecast

**Layout:**
```
[Revenue forecast line]        [Strategic outlook text]
[Scenario cards]  [HC forecast]  [Cloud % target bars]
```

For forecasting: right-click a line series → Analyze → Add forecast (Power BI built-in).

---

## Step 9 — Slicers and Navigation

**Slicers to add (apply to all pages):**
- Company slicer: Tile style, from Dim_Company
- FY slicer: Dropdown, from Dim_FY[FY_Label]

**Navigation buttons:**
1. Insert → Buttons → Blank button
2. Set Action → Type: Page Navigation → Destination: target page
3. Format button with corporate style
4. Copy paste for all 5 pages
5. Group into a nav panel on the left

**Sync slicers** across all pages: View → Sync Slicers → select all pages.

---

## Step 10 — Final Polish

- Add dynamic titles: title text box → use conditional formatting → field value → create a DAX measure returning the title string
- Add drill-through: right-click a page → Add drill-through → set field (e.g. Company)
- Add custom tooltips: create a tooltip page, set Page info → Page type: Tooltip
- Review alignment: select multiple visuals → Format → Align
- Check all visuals for consistent font size (body: 9–10pt, titles: 11pt, KPIs: 22–28pt)

---

## Publishing to GitHub

```bash
# Clone or create repo
git init
git remote add origin https://github.com/YOUR_USERNAME/IT-Services-Dashboard.git

# Add all files (do NOT commit .pbix if file is >100MB — use Git LFS)
git add README.md data/ dax/ docs/ assets/ pbix-guide/

# Commit
git commit -m "Initial commit — IT Services BI Dashboard"

# Push
git push -u origin main
```

**For the .pbix file (usually 5–30MB — fine for GitHub):**
```bash
git add IT_Services_Dashboard.pbix
git commit -m "Add Power BI file"
git push
```

If the file exceeds 100MB, use Git LFS:
```bash
git lfs install
git lfs track "*.pbix"
git add .gitattributes
git add IT_Services_Dashboard.pbix
git commit -m "Add Power BI file via LFS"
git push
```

---

## Publishing Your Work

1. Publish to Power BI Service: File → Publish → Publish to Power BI
2. In app.powerbi.com → share the dashboard link
3. Add that link to your GitHub README under "Live Demo"
4. Screenshot each page and add to `assets/` folder for README preview
