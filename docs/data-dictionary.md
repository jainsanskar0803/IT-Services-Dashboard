# Data Dictionary — IT Services Dashboard

## Table: Annual_Revenue

| Column | Type | Unit | Description | Source |
|---|---|---|---|---|
| Company | Text | — | Company name | — |
| FY2020–FY2025E | Number | USD $M | Annual revenue | Annual Reports |

**Notes:**
- TCS, Infosys, Wipro, HCL fiscal year ends March 31
- Accenture fiscal year ends August 31
- All figures converted to USD at prevailing annual average exchange rates (RBI / xe.com)
- FY2025E = analyst consensus estimates as of Q3 FY25 earnings season

---

## Table: Quarterly_Revenue

| Column | Type | Unit | Description |
|---|---|---|---|
| Company | Text | — | Company name |
| Quarter | Text | — | Q1–Q4 within fiscal year |
| FY_Year | Text | — | Fiscal year identifier |
| Revenue_USD_M | Number | USD $M | Quarterly revenue |
| QoQ_Growth_% | % | — | Quarter-on-quarter growth (formula) |
| YoY_Growth_% | % | — | Year-on-year same quarter growth (formula) |
| Beat_Estimate | Text | Yes/Inline/Miss | Whether result beat street estimate |

**Notes:**
- Q1 = April–June for Indian IT companies; October–December for Accenture
- "Inline" = within ±50bps of consensus estimate

---

## Table: Profitability

| Column | Type | Unit | Description |
|---|---|---|---|
| Company | Text | — | Company name |
| FY | Text | — | Fiscal year |
| Revenue_USD_M | Number | USD $M | Total revenue (matches Annual_Revenue) |
| Gross_Profit_M | Number | USD $M | Revenue minus direct cost of delivery |
| EBIT_M | Number | USD $M | Earnings before interest and tax |
| Net_Profit_M | Number | USD $M | Profit after tax attributable to shareholders |
| Gross_Margin_% | % | — | Gross Profit / Revenue |
| EBIT_Margin_% | % | — | EBIT / Revenue |
| Net_Margin_% | % | — | Net Profit / Revenue |
| EPS_USD | Number | USD | Earnings per share (diluted) |

**Margin benchmarks by peer:**
- TCS: EBIT margin target band 26–28%
- Infosys: EBIT margin guidance 20–22% typically
- Wipro: EBIT margin target 17–17.5%
- HCL: EBIT margin target 18–19%
- Accenture: EBIT margin ~15.5–16%

---

## Table: Workforce_Attrition

| Column | Type | Unit | Description |
|---|---|---|---|
| Company | Text | — | Company name |
| FY | Text | — | Fiscal year |
| Total_Employees | Number | Headcount | End-of-year employee count |
| Net_Additions | Number | Headcount | Gross hires minus leavers |
| Attrition_% | % | — | LTM attrition as reported by company |
| Freshers_Hired | Number | Headcount | Campus/graduate hires |
| Lateral_Hired | Number | Headcount | Experienced professional hires |
| Revenue_Per_Employee_K | Number | USD $K | Revenue / Avg headcount |
| Utilization_% | % | — | % of billable employees on active projects |

**Important context:**
- Attrition methodology differs slightly by company; some exclude trainees
- FY22 "Great Attrition" spike driven by US and Europe tech talent wars
- FY24 headcount reduction at Infosys (–25,994) and Wipro (–25,504) is demand-driven, not restructuring

---

## Table: Cloud_AI_Digital

| Column | Type | Unit | Description |
|---|---|---|---|
| Company | Text | — | Company name |
| FY | Text | — | Fiscal year |
| Total_Revenue_M | Number | USD $M | Total company revenue |
| Cloud_Revenue_M | Number | USD $M | Revenue from cloud services and migration |
| AI_Digital_Revenue_M | Number | USD $M | Revenue from AI, analytics, digital transformation |
| Consulting_Revenue_M | Number | USD $M | Technology consulting and advisory revenue |
| Cloud_Share_% | % | — | Cloud Revenue / Total Revenue |
| AI_Digital_Share_% | % | — | AI/Digital Revenue / Total Revenue |
| Cloud_YoY_% | % | — | Cloud Revenue YoY growth |

**Segment disclosure notes:**
- TCS reports Digital as % of overall revenue since FY19; no separate P&L
- Infosys Cloud Cobalt launched September 2020; Cobalt revenue tracked from FY21
- Accenture Cloud First launched October 2020; cloud bookings disclosed quarterly
- HCL Cloud Smart disclosed as a revenue category from FY21 onwards
- Wipro does not separately disclose cloud revenue; figures are analyst estimates

---

## Table: Geographic_Revenue

| Column | Type | Unit | Description |
|---|---|---|---|
| Company | Text | — | Company name |
| FY | Text | — | Fiscal year |
| North_America_% | % | — | Revenue from USA and Canada |
| Europe_% | % | — | Revenue from Continental Europe (excl. UK) |
| UK_% | % | — | Revenue from United Kingdom |
| India_% | % | — | Revenue from India domestic market |
| APAC_% | % | — | Revenue from Asia Pacific region |
| RoW_% | % | — | Rest of World (Middle East, Africa, LatAm) |
| Total_Revenue_M | Number | USD $M | Total revenue for cross-check |

**Geographic mix drivers:**
- North America dominates for Infosys (62%+) and HCL (63%+)
- Accenture has highest Europe exposure (~28%) due to deep continental presence
- TCS has more balanced mix with stronger UK/Europe from legacy Citi/ABN Amro deals
- India domestic revenue represents BSNL deal for TCS from FY23

---

## Fiscal Year Reference

| FY Label | Period (Indian IT) | Period (Accenture) |
|---|---|---|
| FY2020 | Apr 2019 – Mar 2020 | Sep 2019 – Aug 2020 |
| FY2021 | Apr 2020 – Mar 2021 | Sep 2020 – Aug 2021 |
| FY2022 | Apr 2021 – Mar 2022 | Sep 2021 – Aug 2022 |
| FY2023 | Apr 2022 – Mar 2023 | Sep 2022 – Aug 2023 |
| FY2024 | Apr 2023 – Mar 2024 | Sep 2023 – Aug 2024 |
| FY2025E | Apr 2024 – Mar 2025 | Sep 2024 – Aug 2025 |
