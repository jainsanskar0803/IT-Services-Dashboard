# Power BI Layout Wireframe & Visual Specification
## IT Services Intelligence Dashboard

Canvas size: **1366 × 768 px** (16:9 widescreen)

---

## GLOBAL ELEMENTS (all pages)

### Left Navigation Panel
- Position: X=0, Y=0, W=100, H=768
- Background: #161B27
- Border-right: 1px #2A3248
- Contents: 5 navigation buttons (see below)

**Nav Button spec:**
- Size: W=100, H=70 each
- Stacked vertically: Y=80, 150, 220, 290, 360
- Default state: background transparent, text #64748B, font 9pt Segoe UI
- Active/hover state: background #1C2333, left border 2px #38BDF8, text #E2E8F0
- Icon: use Power BI button blank + image overlay (PNG icons from assets/)
- Label text below icon, uppercase, letter-spacing 0.06em

**Logo/Title area:**
- Position: X=0, Y=0, W=100, H=70
- Text: "IT Intel" (abbreviated), 10pt Segoe UI Semibold, color #38BDF8

### Top Filter Bar
- Position: X=100, Y=0, W=1266, H=48
- Background: #161B27
- Border-bottom: 1px #2A3248
- Contains: Page title (dynamic DAX), Company slicer (tile), FY slicer (dropdown), "Source: Annual Reports" label

**Slicer — Company:**
- Position: X=340, Y=8, W=480, H=32
- Style: Tile (horizontal), no border, background #0F1117
- Selected tile: background #38BDF8, text #0F1117
- Unselected tile: text #64748B, hover text #E2E8F0

**Slicer — FY:**
- Position: X=840, Y=8, W=180, H=32
- Style: Dropdown
- Font: 10pt, color #94A3B8

### Content Area
- Position: X=100, Y=48, W=1266, H=720
- Background: #0F1117
- All visuals sit inside this zone with 16px padding on all sides

---

## PAGE 1 — EXECUTIVE SUMMARY

### KPI Cards Row
- Position: X=116, Y=64, W=1234, H=100
- Layout: 6 equal cards, W=196 each, gap=10px

| # | Metric | DAX Measure | Format |
|---|---|---|---|
| 1 | Industry Revenue FY25E | `Total Revenue` filtered FY2025E | $#,##0M → show as $145.1B |
| 2 | Combined Net Profit | `Total Net Profit` FY25E | $#,##0M |
| 3 | Total Workforce | `Total Employees` FY25E | #,##0K |
| 4 | Avg Attrition Rate | `Latest Attrition %` | 0.0% |
| 5 | Avg EBIT Margin | `EBIT Margin %` FY25E | 0.0% |
| 6 | Cloud Revenue Share | `Cloud Revenue Share %` FY25E | 0.0% |

**Card visual settings:**
- Background: #1C2333, border: 0.5px #2A3248, radius: 6px
- Data label: 26pt Segoe UI Light, color #E2E8F0
- Category label: 9pt Segoe UI, color #64748B, uppercase
- Delta callout: text box below value, 10pt, green (#10B981) for positive, red (#F43F5E) for negative

---

### Revenue Trend Line Chart (large, left)
- Position: X=116, Y=176, W=820, H=260
- Visual type: Line Chart
- X-axis: Dim_FY[FY_Label] (sort by Sort_Order)
- Y-axis: `Total Revenue` ($M)
- Legend: Company (hide default legend → build custom HTML text boxes)
- Series: 5 lines, one per company, colors per palette
- Markers: circle, 4px, filled
- Line weight: 2px
- Grid lines: #2A3248, 0.5px
- Y-axis title: "Revenue (USD $M)"
- Add annotation callout for FY22 spike: "COVID-era demand surge"

**Series colors:**
- TCS: #38BDF8 (solid)
- Infosys: #A78BFA (solid)
- Wipro: #F59E0B (solid)
- HCL Tech: #10B981 (solid)
- Accenture: #F43F5E (dashed — note: Accenture revenue ÷3 to fit scale)

---

### Revenue Share Donut Chart (right)
- Position: X=952, Y=176, W=448, H=260
- Visual type: Donut Chart
- Values: `Total Revenue` FY25E only
- Legend: Company
- Inner radius: 65%
- Colors: match series palette
- Center label: "FY25E" in white, 12pt
- No default legend → place custom legend table below donut

**Custom legend table (below donut):**
- Simple table visual, 5 rows × 2 cols (Company, Revenue %)
- Conditional formatting: color swatch column using company color
- Font: 10pt, color #94A3B8

---

### EBIT Margin Bar Chart (lower left)
- Position: X=116, Y=452, W=540, H=220
- Visual type: Clustered Bar Chart
- X-axis: Dim_FY[FY_Label]
- Y-axis: `EBIT Margin %`
- Series: 5 companies (same colors)
- Show data labels: 9pt, on bars, hide if bar too narrow (threshold 15px)
- Y-axis range: 10% to 30%

---

### Executive Insights Panel (lower right)
- Position: X=672, Y=452, W=728, H=220
- Visual type: Text boxes (4 stacked insight cards)

**Insight card spec:**
- Background: #161B27
- Left border: 3px solid #38BDF8 (or company accent color)
- Border-radius: 0 4px 4px 0
- Padding: 10px 14px
- Font: 10pt Segoe UI, color #94A3B8, line-height 1.6
- Company name: bold, color #E2E8F0

---

## PAGE 2 — COMPANY PERFORMANCE COMPARISON

### Revenue Grouped Bar (top left)
- Position: X=116, Y=64, W=640, H=250
- Visual type: Clustered Bar Chart
- X-axis: Dim_FY[FY_Label]
- Y-axis: Revenue ($M)
- Legend: Company
- Same 5-company color scheme
- Y-axis label: "$M"

### Net Profit Margin Horizontal Bars (top right)
- Position: X=772, Y=64, W=628, H=250
- Visual type: Bar Chart (horizontal / indexAxis: y)
- Y-axis: Company names
- X-axis: Net Margin % (0 to 25%)
- One bar per company, company color fill
- Data labels: right-aligned, white, 10pt
- Sort: descending by margin value

### Metrics Scorecard Table (full width)
- Position: X=116, Y=330, W=1234, H=190
- Visual type: Matrix
- Rows: Company (from Dim_Company)
- Columns: manually selected measures (FY24 Rev, FY25E Rev, YoY%, EBIT Margin, Net Margin, Employees, Attrition, Cloud%)
- Conditional formatting on YoY%: green background if positive, red if negative
- Conditional formatting on Attrition: red scale (higher = more red)
- Font: 10pt, row height: 32px
- Header: 9pt uppercase, color #64748B, background #161B27

### CAGR Comparison Chart (full width)
- Position: X=116, Y=536, W=1234, H=180
- Visual type: Clustered Bar Chart
- X-axis: Company
- Y-axis: CAGR % (0 to 15%)
- Two series: Revenue CAGR (opaque), Profit CAGR (60% opacity)
- Data labels: show above bars, 9pt

---

## PAGE 3 — WORKFORCE & ATTRITION ANALYTICS

### KPI Cards Row (6 cards)
- Position: X=116, Y=64, W=1234, H=90
- Same spec as Page 1 KPI row but with workforce metrics
- Metrics: Total Workforce, TCS HC, Accenture HC, Avg Attrition, Peak Attrition (FY22 Infosys), Rev/Employee TCS

### Headcount Trend Line (top left)
- Position: X=116, Y=170, W=618, H=220
- Visual type: Line Chart
- X-axis: FY, Y-axis: Total Employees (K)
- 4 series (TCS, Infosys, Wipro, HCL — Accenture on secondary axis or ÷5)
- Add reference line at FY22 peak with annotation "Great Hiring Wave"

### Attrition Trend Line (top right)
- Position: X=750, Y=170, W=600, H=220
- Visual type: Line Chart
- X-axis: FY, Y-axis: Attrition %
- 4 series (same companies)
- Add shaded area between FY21–FY23 to highlight "Attrition Crisis" zone
- Reference line at 20% (industry stress threshold)

### Revenue Per Employee Bar (bottom left)
- Position: X=116, Y=406, W=450, H=266
- Visual type: Horizontal Bar Chart
- Y-axis: Company, X-axis: Revenue Per Employee $K
- Colors: match company palette
- Sorted descending
- Data labels outside bars

### Workforce Insights Panel (bottom right)
- Position: X=582, Y=406, W=768, H=266
- Three insight cards, same spec as Page 1 insights
- Content: FY22 boom, FY24 correction, attrition normalisation

---

## PAGE 4 — CLOUD & AI DIGITAL ANALYTICS

### KPI Cards Row (6 cards)
- Position: X=116, Y=64, W=1234, H=90
- Metrics: Accenture Cloud Rev, TCS Digital Rev, Infosys Cloud Cobalt, HCL Cloud, Wipro Cloud, Industry Cloud CAGR

### Cloud Revenue Growth Line (top left)
- Position: X=116, Y=170, W=618, H=230
- Visual type: Line Chart with area fill (10% opacity)
- X: FY, Y: Cloud Revenue $M
- 5 series, Accenture ÷4 to share scale
- Annotation at FY21: "Cloud First / Cobalt launches"

### Cloud % Horizontal Bars (top right)
- Position: X=750, Y=170, W=600, H=230
- Visual type: Horizontal Bar Chart
- Y: Company, X: Cloud Revenue Share % (0–50%)
- Sorted descending
- Reference line at 25% (digital inflection threshold)
- Data labels outside right edge

### AI & Digital Revenue Grouped Bar (full width)
- Position: X=116, Y=416, W=1234, H=236
- Visual type: Clustered Bar Chart
- X: Company, Y: $M
- 3 series: FY23 (40% opacity), FY24 (70% opacity), FY25E (full opacity)
- Same blue (#38BDF8) tint for all three series
- Data labels on top of bars

---

## PAGE 5 — FORECASTING & STRATEGIC OUTLOOK

### Revenue Forecast Line (top left, large)
- Position: X=116, Y=64, W=618, H=280
- Visual type: Line Chart
- X: FY (FY24 through FY27E), Y: Revenue $B
- Solid lines FY24–FY25E (actual/estimate)
- Dashed lines FY26E–FY27E (forecast)
- 5 company series
- Shaded confidence band on forecast portion using reference line + area visual layered
- Background annotation: "Forecast zone" label on FY26–FY27 area

### Strategic Outlook Panel (top right)
- Position: X=750, Y=64, W=600, H=280
- 4 insight cards with different left-border accent colors:
  - Cloud migration: #10B981 (green)
  - Gen AI: #A78BFA (purple)
  - BFSI recovery: #F59E0B (gold)
  - Workforce efficiency: #F43F5E (red)

### Scenario Cards Row (bottom left)
- Position: X=116, Y=360, W=380, H=252
- 3 cards side by side: Bear, Base, Bull
- Bear: background #F43F5E/15%, value "+3–4%", label "Demand contraction"
- Base: background #38BDF8/15%, value "+6–8%", label "Gradual recovery"
- Bull: background #10B981/15%, value "+9–12%", label "AI-led acceleration"

### Headcount Forecast Bars (bottom center)
- Position: X=512, Y=360, W=450, H=252
- Visual type: Clustered Bar Chart
- X: Company (TCS, Infosys, Wipro, HCL)
- 3 series: FY25E, FY26E, FY27E
- Blue tint gradation (same as Cloud/Digital page)
- Legend in subtitle text box

### Cloud % Target Bars (bottom right)
- Position: X=978, Y=360, W=372, H=252
- Visual type: Horizontal Bar Chart
- FY27E cloud revenue % target per company
- Same horizontal bar format as other pages
- Target reference line at 30% ("next digital threshold")

---

## TOOLTIP PAGES

Create one tooltip page per main chart type:

### Tooltip: Company Revenue Detail
- Page type: Tooltip, W=340, H=200
- Shows: Company name, latest revenue, YoY growth, EBIT margin, sparkline trend
- Trigger: hover on any company data point in revenue charts

### Tooltip: Workforce Detail
- Page type: Tooltip, W=340, H=200
- Shows: Headcount, attrition %, net additions, revenue per employee
- Trigger: hover on workforce chart data points

---

## DRILL-THROUGH PAGE

### Company Deep Dive (Drill-through)
- Page type: Normal (set as drill-through target)
- Drill field: Company
- Contains: full 5-year metrics for single selected company
  - Revenue + profit trend (combo chart)
  - Quarterly revenue trend (last 8 quarters)
  - Headcount and attrition trend
  - Cloud revenue breakdown
  - Back button (built-in Power BI back button)

---

## BOOKMARKS

Create the following bookmarks for storytelling mode:

| Bookmark Name | State |
|---|---|
| All Companies | All slicers cleared |
| TCS Focus | Company slicer = TCS only |
| Infosys Focus | Company slicer = Infosys only |
| FY22 Attrition Peak | Page 3 active, FY slicer = FY2022 |
| Cloud Transformation | Page 4 active, all years |
| Forecast View | Page 5 active |

Add bookmark navigator to Page 1 as a "Story Mode" button row.

---

## VISUAL HIERARCHY SUMMARY

| Level | Font Size | Weight | Color | Use |
|---|---|---|---|---|
| Page title | 14pt | 600 | #E2E8F0 | Page header |
| Section title | 11pt | 600 | #94A3B8 uppercase | Panel headers |
| KPI value | 24–28pt | 300 | #E2E8F0 | Card numbers |
| KPI label | 9pt | 400 | #64748B | Card labels |
| Chart axis | 9–10pt | 400 | #64748B | Tick labels |
| Data labels | 9pt | 400 | #E2E8F0 | On-chart values |
| Insight body | 10pt | 400 | #94A3B8 | Text panels |
| Insight bold | 10pt | 600 | #E2E8F0 | Company names in insights |
| Table header | 9pt | 600 | #64748B | Matrix/table headers |
| Table body | 10pt | 400 | #94A3B8 | Matrix/table rows |
