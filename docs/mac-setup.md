# Mac Setup Guide — Running Power BI on macOS

Power BI Desktop is Windows-only. This guide walks you through the cleanest options for Mac users.

---

## Option 1 — Parallels Desktop (Recommended)

The closest to native experience. Runs Windows in a window alongside your Mac apps.

### Setup Steps

```bash
# 1. Download Parallels Desktop
# https://www.parallels.com/products/desktop/trial/
# 14-day free trial, then $99/year

# 2. On first launch, Parallels will offer to download Windows 11 ARM for free
# Click "Install Windows 11" — Parallels handles the download

# 3. Once Windows is running, open Edge browser inside Parallels
# Go to: https://www.microsoft.com/en-us/power-bi/downloads
# Download Power BI Desktop (free)

# 4. Install Power BI Desktop inside Windows

# 5. Your Mac files are accessible from Windows at:
# \\Mac\Home\  (maps to your Mac home directory)
# So you can open the Excel dataset directly from your Mac Downloads folder
```

### Parallels tips for Power BI:
- Allocate at least 8GB RAM to the Windows VM (Parallels → Configure → Hardware → Memory)
- Enable "Coherence mode" so Power BI windows appear alongside your Mac apps
- Set shared clipboard ON — you can copy DAX from your Mac text editor and paste into Power BI

---

## Option 2 — VMware Fusion (Free for Personal Use)

```bash
# 1. Download VMware Fusion Player (free)
# https://www.vmware.com/products/fusion.html

# 2. Download Windows 11 ARM ISO
# https://www.microsoft.com/en-us/software-download/windows11arm64

# 3. Create new VM in VMware → use the ISO
# Allocate: 8GB RAM, 4 CPU cores, 80GB disk

# 4. Install Power BI Desktop inside Windows VM
```

---

## Option 3 — Power BI Service (Browser, No Windows Needed)

For publishing and sharing — limited build capability but works entirely on Mac.

```
1. Go to https://app.powerbi.com
2. Sign in with a free Microsoft account (@outlook.com works)
3. Upload your .pbix file (built on Windows/VM) to publish
4. Share the dashboard link publicly
```

**Limitation:** You cannot build reports in the browser — only view and share. You need Power BI Desktop (Windows) to build.

---

## Option 4 — GitHub Codespaces + Web (Advanced)

Not recommended for Power BI, but you can use this repo for data exploration with Python + Plotly in a browser:

```bash
# In terminal (Mac)
pip3 install pandas openpyxl plotly jupyter

# Launch Jupyter
jupyter notebook

# Open the data files and explore with Python
import pandas as pd
df = pd.read_excel('data/IT_Services_Dashboard_Dataset.xlsx', sheet_name='Annual_Revenue')
print(df)
```

---

## Workflow for Mac Users (Recommended)

```
Mac (data prep + DAX writing)  →  Parallels/Windows (Power BI build)  →  Power BI Service (publish)
          ↓                                    ↓                                    ↓
   Edit Excel in Numbers           Open .pbix, load data            Share link on GitHub
   or Excel for Mac                Apply theme.json                  Add screenshot to README
   Write DAX in TextEdit            Build 5 pages
```

---

## Transferring Files Between Mac and Windows (Parallels)

Your Mac home folder appears in Windows as a network drive:
- In Windows Explorer: `\\Mac\Home\Downloads\` = your Mac Downloads folder
- You can open the Excel dataset directly from this path in Power BI

Or use a shared folder:
```
Parallels menu → Shared Folders → + → add your project folder
```

---

## Publishing to GitHub from Mac

```bash
# Install Git (if not already installed — Xcode Command Line Tools)
xcode-select --install

# Configure Git
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Clone this repo (or init new)
cd ~/Desktop
git clone https://github.com/YOUR_USERNAME/IT-Services-Dashboard.git

# Or init fresh
mkdir IT-Services-Dashboard && cd IT-Services-Dashboard
git init
git remote add origin https://github.com/YOUR_USERNAME/IT-Services-Dashboard.git

# Add files and push
git add .
git commit -m "Initial commit — IT Services BI Dashboard"
git branch -M main
git push -u origin main
```

### Install GitHub CLI (easier auth on Mac)
```bash
brew install gh
gh auth login
gh repo create IT-Services-Dashboard --public --source=. --remote=origin --push
```

---

## Screenshot Your Dashboard for the README

On Mac (after building in Parallels):
```
Cmd + Shift + 4 → drag to select the Power BI window
```

Save screenshots to `assets/` folder:
- `assets/page1-executive-summary.png`
- `assets/page2-company-comparison.png`
- `assets/page3-workforce.png`
- `assets/page4-cloud-digital.png`
- `assets/page5-forecast.png`

Then update README.md to reference these images.

---

## Making Your GitHub Profile Stand Out

1. Pin this repo on your GitHub profile
2. Add topics to the repo: `power-bi` `data-analytics` `business-intelligence` `IT-industry` `DAX` `financial-analysis`
3. Write a description: "Enterprise Power BI dashboard comparing TCS, Infosys, Wipro, HCL, Accenture — 5 pages, 16 DAX measures, realistic data from annual reports"
4. Enable GitHub Pages if you want to host the HTML preview version
5. Add a `LIVE DEMO →` link in the README pointing to your Power BI Service published report
