// ============================================================
// POWER QUERY (M) TRANSFORMATION SCRIPTS
// Paste each section into the Power Query Advanced Editor
// for the corresponding table
// ============================================================


// ─── Annual_Revenue TABLE ─────────────────────────────────────
// Applied Steps: Source → Navigate → Promoted Headers → Changed Types → Removed Notes Column → Unpivoted (optional)

let
    Source = Excel.Workbook(File.Contents("IT_Services_Dashboard_Dataset.xlsx"), null, true),
    Annual_Revenue_Sheet = Source{[Item="Annual_Revenue",Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(Annual_Revenue_Sheet, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Company",        type text},
        {"FY2020",         type number},
        {"FY2021",         type number},
        {"FY2022",         type number},
        {"FY2023",         type number},
        {"FY2024",         type number},
        {"FY2025E",        type number},
        {"Notes",          type text}
    }),
    RemovedNotes = Table.RemoveColumns(ChangedTypes, {"Notes"}),

    // UNPIVOT to long format — best for Power BI relationships
    Unpivoted = Table.UnpivotOtherColumns(RemovedNotes, {"Company"}, "FY", "Revenue_USD_M"),
    AddedFYClean = Table.AddColumn(Unpivoted, "FY_Clean", each
        if [FY] = "FY2020" then "FY2020"
        else if [FY] = "FY2021" then "FY2021"
        else if [FY] = "FY2022" then "FY2022"
        else if [FY] = "FY2023" then "FY2023"
        else if [FY] = "FY2024" then "FY2024"
        else if [FY] = "FY2025E" then "FY2025E"
        else "Unknown", type text),
    RenamedFY = Table.RenameColumns(AddedFYClean, {{"FY_Clean", "FY"}, {"FY", "FY_Original"}}),
    FinalTable = Table.RemoveColumns(RenamedFY, {"FY_Original"})
in
    FinalTable


// ─── Profitability TABLE ──────────────────────────────────────

let
    Source = Excel.Workbook(File.Contents("IT_Services_Dashboard_Dataset.xlsx"), null, true),
    Profitability_Sheet = Source{[Item="Profitability",Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(Profitability_Sheet, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Company",         type text},
        {"FY",              type text},
        {"Revenue_USD_M",   type number},
        {"Gross_Profit_M",  type number},
        {"EBIT_M",          type number},
        {"Net_Profit_M",    type number},
        {"Gross_Margin_%",  type number},
        {"EBIT_Margin_%",   type number},
        {"Net_Margin_%",    type number},
        {"EPS_USD",         type number},
        {"Notes",           type text}
    }),
    RemovedNotes = Table.RemoveColumns(ChangedTypes, {"Notes"})
in
    RemovedNotes


// ─── Workforce_Attrition TABLE ────────────────────────────────

let
    Source = Excel.Workbook(File.Contents("IT_Services_Dashboard_Dataset.xlsx"), null, true),
    WF_Sheet = Source{[Item="Workforce_Attrition",Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(WF_Sheet, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Company",                   type text},
        {"FY",                        type text},
        {"Total_Employees",           type number},
        {"Net_Additions",             Int64.Type},
        {"Attrition_%",               type number},
        {"Freshers_Hired",            type number},
        {"Lateral_Hired",             type number},
        {"Revenue_Per_Employee_K",    type number},
        {"Utilization_%",             type number},
        {"Notes",                     type text}
    }),
    RemovedNotes = Table.RemoveColumns(ChangedTypes, {"Notes"}),

    // Add Headcount Category for heatmap coloring
    AddedCategory = Table.AddColumn(RemovedNotes, "Attrition_Category", each
        if [Attrition_%] >= 0.25 then "Critical (>25%)"
        else if [Attrition_%] >= 0.18 then "High (18-25%)"
        else if [Attrition_%] >= 0.13 then "Elevated (13-18%)"
        else "Normal (<13%)", type text)
in
    AddedCategory


// ─── Cloud_AI_Digital TABLE ───────────────────────────────────

let
    Source = Excel.Workbook(File.Contents("IT_Services_Dashboard_Dataset.xlsx"), null, true),
    Cloud_Sheet = Source{[Item="Cloud_AI_Digital",Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(Cloud_Sheet, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Company",               type text},
        {"FY",                    type text},
        {"Total_Revenue_M",       type number},
        {"Cloud_Revenue_M",       type number},
        {"AI_Digital_Revenue_M",  type number},
        {"Consulting_Revenue_M",  type number},
        {"Cloud_Share_%",         type number},
        {"AI_Digital_Share_%",    type number},
        {"Cloud_YoY_%",           type text},   // text because some rows have "N/A"
        {"Notes",                 type text}
    }),

    // Convert Cloud_YoY_% — replace "N/A" with null, then cast to number
    ReplacedNA = Table.ReplaceValue(ChangedTypes, "N/A", null,
        Replacer.ReplaceValue, {"Cloud_YoY_%"}),
    ConvertedYoY = Table.TransformColumnTypes(ReplacedNA, {
        {"Cloud_YoY_%", type number}
    }),
    RemovedNotes = Table.RemoveColumns(ConvertedYoY, {"Notes"})
in
    RemovedNotes


// ─── Geographic_Revenue TABLE ─────────────────────────────────

let
    Source = Excel.Workbook(File.Contents("IT_Services_Dashboard_Dataset.xlsx"), null, true),
    Geo_Sheet = Source{[Item="Geographic_Revenue",Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(Geo_Sheet, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Company",          type text},
        {"FY",               type text},
        {"North_America_%",  type number},
        {"Europe_%",         type number},
        {"UK_%",             type number},
        {"India_%",          type number},
        {"APAC_%",           type number},
        {"RoW_%",            type number},
        {"Total_Revenue_M",  type number},
        {"Notes",            type text}
    }),
    RemovedNotes = Table.RemoveColumns(ChangedTypes, {"Notes"}),

    // Unpivot geography columns for easier map/chart use
    Unpivoted = Table.UnpivotOtherColumns(
        RemovedNotes,
        {"Company", "FY", "Total_Revenue_M"},
        "Geography",
        "Revenue_%"
    )
in
    Unpivoted


// ─── Quarterly_Revenue TABLE ──────────────────────────────────

let
    Source = Excel.Workbook(File.Contents("IT_Services_Dashboard_Dataset.xlsx"), null, true),
    QR_Sheet = Source{[Item="Quarterly_Revenue",Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(QR_Sheet, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Company",            type text},
        {"Quarter",            type text},
        {"FY_Year",            type text},
        {"Revenue_USD_M",      type number},
        {"QoQ_Growth_%",       type any},
        {"YoY_Growth_%",       type any},
        {"Sequential_Change",  type any},
        {"Beat_Estimate",      type text},
        {"Notes",              type text}
    }),

    // Clean up formula results — some will be text "N/A"
    ReplacedNA_QoQ = Table.ReplaceValue(ChangedTypes, "N/A", null,
        Replacer.ReplaceValue, {"QoQ_Growth_%"}),
    ReplacedNA_YoY = Table.ReplaceValue(ReplacedNA_QoQ, "N/A", null,
        Replacer.ReplaceValue, {"YoY_Growth_%"}),
    ConvertedNumbers = Table.TransformColumnTypes(ReplacedNA_YoY, {
        {"QoQ_Growth_%",      type number},
        {"YoY_Growth_%",      type number},
        {"Sequential_Change", type number}
    }),
    RemovedNotes = Table.RemoveColumns(ConvertedNumbers, {"Notes"}),

    // Add sort key for proper chronological ordering in charts
    AddedSortKey = Table.AddColumn(RemovedNotes, "Sort_Order", each
        let
            fyNum = Number.FromText(Text.Middle([FY_Year], 2, 4)),
            qNum  = Number.FromText(Text.Middle([Quarter], 1, 1))
        in (fyNum - 2020) * 4 + qNum, Int64.Type),

    // Combine to Quarter_Label for chart axis
    AddedLabel = Table.AddColumn(AddedSortKey, "Quarter_Label",
        each [Quarter] & " " & [FY_Year], type text)
in
    AddedLabel


// ─── Dim_Company TABLE (create via Enter Data, then this M) ──

let
    Source = Table.FromRows(
        Json.Document(Binary.Decompress(Binary.FromText("...", BinaryEncoding.Base64), Compression.Deflate)),
        let _t = ((type nullable text) meta [Serialized.Text = true]) in
        type table [Company = _t, Ticker = _t, Exchange = _t, HQ_Country = _t, Founded = _t]
    )
in
    Source

// Simpler — just use Enter Data in Power BI Desktop:
// Company    | Ticker      | Exchange  | HQ         | Founded
// TCS        | TCS.NS      | NSE/BSE   | Mumbai     | 1968
// Infosys    | INFY        | NYSE/NSE  | Bengaluru  | 1981
// Wipro      | WIT         | NYSE/NSE  | Bengaluru  | 1945
// HCL Tech   | HCLTECH.NS  | NSE       | Noida      | 1976
// Accenture  | ACN         | NYSE      | Dublin     | 1989
