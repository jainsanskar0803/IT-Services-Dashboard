# IT Services Industry — Revenue & Workforce Intelligence

> Enterprise-grade analytics dashboard comparing **TCS · Infosys · Wipro · HCL Technologies · Accenture**
> across revenue, profitability, workforce intelligence, cloud transformation, and AI growth trends from FY2020 to FY2025E.

---

# Overview

This project is a fully interactive business intelligence dashboard designed to analyze the IT services industry using executive-level analytics and enterprise dashboard storytelling.

The dashboard delivers:

- Financial performance benchmarking
- Workforce and attrition analytics
- Cloud and AI revenue intelligence
- Forecast modelling and scenario analysis
- Dynamic company comparison
- Enterprise dashboard UX patterns

Inspired by:
- Gartner-style analytics dashboards
- Enterprise KPI portals
- Power BI executive reporting systems

---

# Companies Covered

- Tata Consultancy Services (TCS)
- Infosys
- Wipro
- HCL Technologies
- Accenture

---

# Features

## Executive Overview
- Dynamic KPI cards
- Revenue growth analysis
- EBIT and profitability insights
- Market share visualization
- Analyst commentary system

## Company Comparison
- Revenue benchmarking
- Net margin comparison
- CAGR analysis
- Quarterly performance trends
- Company scorecards

## Workforce Analytics
- Headcount trends
- Attrition intelligence
- Revenue per employee
- Hiring analysis

## Cloud & AI Intelligence
- Cloud revenue trajectory
- AI and digital transformation metrics
- Geographic revenue mix
- Cloud share analysis

## Forecasting
- FY2027E projections
- Bear / Base / Bull scenarios
- Workforce forecast
- Analyst consensus estimates

---

# Live Dashboard

```text
https://github.com/jainsanskar0803/IT-Services-Dashboard.git
```

---

# Quick Start

## Clone Repository

```bash
git clone https://github.com/YOUR-USERNAME/IT-Services-Dashboard.git
```

## Open Dashboard

```bash
cd IT-Services-Dashboard
open index.html
```

No installation required.

Runs directly in any modern browser.

---

# GitHub Pages Deployment

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/IT-Services-Dashboard.git
git push -u origin main
```

Then:

```text
GitHub → Settings → Pages → Source → main / root → Save
```

---

# Project Structure

```text
IT-Dashboard-Final/
│
├── index.html                          # Main interactive dashboard
├── README.md                           # Project documentation
├── .gitignore                          # Git ignore rules
│
├── assets/
│   └── theme.json                      # Power BI enterprise dark theme
│
├── data/
│   └── IT_Services_Industry_Data.xlsx  # Source dataset and financial model
│
├── dax/
│   └── all-measures.dax                # DAX measures and calculations
│
├── docs/
│   ├── build-guide.md                  # Dashboard build instructions
│   ├── data-dictionary.md              # Dataset definitions and explanations
│   └── mac-setup.md                    # Mac + Power BI setup guide
│
└── pbix-guide/
    ├── layout-wireframe.md             # Dashboard layout planning
    └── power-query-M-scripts.m         # Power Query transformation scripts
```

---

# Dashboard Tabs

| Dashboard Section | Description |
|---|---|
| Overview | KPI cards, revenue trends, analyst commentary |
| Comparison | Revenue and profitability benchmarking |
| Workforce | Headcount and attrition analysis |
| Cloud & AI | Cloud and digital transformation metrics |
| Forecast | Future projections and analyst scenarios |

---

# Dynamic Filter System

All charts, KPIs, and analytics respond dynamically to filters.

## Company Filter
- All Companies
- TCS
- Infosys
- Wipro
- HCL Technologies
- Accenture

## Period Filter
- FY20–FY25E
- FY23–FY25E
- FY25E

---

# Data Sources

| Company | Investor Relations Source |
|---|---|
| TCS | tcs.com |
| Infosys | infosys.com |
| Wipro | wipro.com |
| HCL Technologies | hcltech.com |
| Accenture | accenture.com |

### Forecast Data
- Bloomberg consensus estimates
- Refinitiv estimates
- Industry analyst projections

---

# Dataset Coverage

| Dataset | Metrics Included |
|---|---|
| Annual Revenue | Revenue and YoY growth |
| Quarterly Revenue | QoQ and YoY trends |
| Profitability | EBIT, net margin, EPS |
| Workforce | Headcount, attrition, hiring |
| Cloud & AI | Cloud revenue and digital mix |
| Geographic Revenue | Regional business exposure |

---

# Key DAX Measures

```DAX
Revenue CAGR 5Y =
POWER(
    DIVIDE([End Revenue], [Start Revenue]),
    1/5
) - 1

YoY Revenue % =
DIVIDE(
    [Current Year Revenue] - [Previous Year Revenue],
    [Previous Year Revenue]
)

Net Margin % =
DIVIDE(
    SUM(Net_Profit),
    SUM(Revenue)
)
```

---

# Technology Stack

- HTML5
- CSS3
- Vanilla JavaScript
- Chart.js
- Power BI
- DAX
- Excel Financial Modelling

---

# Skills Demonstrated

- Business Intelligence
- Financial Analytics
- Workforce Intelligence
- Dashboard UX Design
- Data Visualization
- DAX Modelling
- Cloud Analytics
- Forecast Modelling
- Data Storytelling

---

# Design System

| Company | Theme Color |
|---|---|
| TCS | Teal Blue |
| Infosys | Purple |
| Wipro | Amber |
| HCL Tech | Emerald |
| Accenture | Coral Red |

Background:
- Enterprise dark dashboard theme

---

# Future Improvements

- Real-time API integration
- Automated refresh pipelines
- Power BI embedded analytics
- Predictive machine learning forecasting
- Mobile responsive optimization
- Export to Excel/PDF

---

# Author

## Sanskar Jain

Data Analyst • Business Intelligence Enthusiast • AIML Student

---

# Tags

```text
Power BI
Data Analytics
Business Intelligence
Financial Analysis
DAX
Dashboard Design
Cloud Analytics
Workforce Analytics
Enterprise Dashboard
Chart.js
```

