namespace RISA.DataEditorTools.DataEditor;

using Fps.BaseApplication.HumanResources.Hours;
using Fps.BaseApplication.ImplementationControl.ImplCompany;
using Fps.BaseApplication.Plant;
using Fps.BaseApplication.Project;
using Microsoft.Bank.Check;
using Microsoft.Bank.DirectDebit;
using Microsoft.Bank.Ledger;
using Microsoft.Bank.Payment;
using Microsoft.Bank.PositivePay;
using Microsoft.Bank.Reconciliation;
using Microsoft.CashFlow.Forecast;
using Microsoft.CostAccounting.Budget;
using Microsoft.CostAccounting.Ledger;
using Microsoft.CRM.Campaign;
using Microsoft.CRM.Interaction;
using Microsoft.CRM.Opportunity;
using Microsoft.Finance.Analysis;
using Microsoft.Finance.Consolidation;
using Microsoft.Finance.Currency;
using Microsoft.Finance.Dimension;
using Microsoft.Finance.GeneralLedger.Budget;
using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.Finance.GeneralLedger.Reversal;
using Microsoft.Finance.VAT.Ledger;
using Microsoft.Finance.VAT.RateChange;
using Microsoft.FixedAssets.Insurance;
using Microsoft.FixedAssets.Ledger;
using Microsoft.FixedAssets.Maintenance;
using Microsoft.Foundation.Address;
using Microsoft.Foundation.Calendar;
using Microsoft.Foundation.Navigate;
using Microsoft.Foundation.NoSeries;
using Microsoft.Foundation.Period;
using Microsoft.HumanResources.Payables;
using Microsoft.Inventory.Analysis;
using Microsoft.Inventory.Costing;
using Microsoft.Inventory.Counting.Journal;
using Microsoft.Inventory.Ledger;
using Microsoft.Inventory.Reconciliation;
using Microsoft.Inventory.Setup;
using Microsoft.Inventory.Tracking;
using Microsoft.Manufacturing.Capacity;
using Microsoft.Manufacturing.Forecast;
using Microsoft.Manufacturing.ProductionBOM;
using Microsoft.Projects.Project.Ledger;
using Microsoft.Projects.Project.WIP;
using Microsoft.Projects.Resources.Ledger;
using Microsoft.Projects.Resources.Resource;
using Microsoft.Projects.TimeSheet;
using Microsoft.Purchases.Payables;
using Microsoft.Sales.FinanceCharge;
using Microsoft.Sales.Receivables;
using Microsoft.Service.Contract;
using Microsoft.Service.Document;
using Microsoft.Service.Ledger;
using Microsoft.Service.Loaner;
using Microsoft.Warehouse.Ledger;
using System.Agents;
using System.Automation;
using System.DataAdministration;
using System.Diagnostics;
using System.Environment.Configuration;
using System.Environment.Consumption;
using System.Integration;
using System.Reflection;
using System.Security.User;
using System.Threading;
using System.Utilities;

report 50300 "RISA DET Clear Company"
{
    Caption = 'Clear Company';
    ProcessingOnly = true;
    UsageCategory = Tasks;
    ApplicationArea = All;
    Permissions =
        tabledata "Action Message Entry" = d,
        tabledata "Analysis View Budget Entry" = d,
        tabledata "Analysis View Entry" = d,
        tabledata "Applied Payment Entry" = d,
        tabledata "Approval Entry" = d,
        tabledata "Avg. Cost Adjmt. Entry Point" = d,
        tabledata "Bank Account Ledger Entry" = d,
        tabledata "Calendar Absence Entry" = d,
        tabledata "Calendar Entry" = d,
        tabledata "Campaign Entry" = d,
        tabledata "Capacity Ledger Entry" = d,
        tabledata "Cash Flow Forecast Entry" = d,
        tabledata "Change Global Dim. Log Entry" = d,
        tabledata "Change Log Entry" = d,
        tabledata "Check Ledger Entry" = d,
        tabledata "Commitment Entry" = d,
        tabledata "Contract Gain/Loss Entry" = d,
        tabledata "Cost Budget Entry" = d,
        tabledata "Cost Entry" = d,
        tabledata "Cost Budget Register" = d,
        tabledata "Cost Register" = d,
        tabledata "Credit Transfer Entry" = d,
        tabledata "Credit Transfer Register" = d,
        tabledata "Cust. Ledger Entry" = d,
        tabledata "Customized Calendar Entry" = d,
        tabledata "Date Compr. Register" = d,
        tabledata "Detailed Cust. Ledg. Entry" = d,
        tabledata "Detailed Employee Ledger Entry" = d,
        tabledata "Detailed Vendor Ledg. Entry" = d,
        tabledata "Dimension Set Entry" = d,
        tabledata "Direct Debit Collection Entry" = d,
        tabledata "Doc. Ref. Point Queue Entry" = d,
        tabledata "Document Entry" = d,
        tabledata "Employee Ledger Entry" = d,
        tabledata "Error Message Register" = d,
        tabledata "Exch. Rate Adjmt. Ledg. Entry" = d,
        tabledata "Expense Allowance Scheme Entry" = d,
        tabledata "FA Ledger Entry" = d,
        tabledata "FA Register" = d,
        tabledata "G/L Budget Entry" = d,
        tabledata "G/L Entry" = d,
        tabledata "G/L Register" = d,
        tabledata "Impl. Company" = r,
        tabledata "Impl. Company Table" = r,
        tabledata "Ins. Coverage Ledger Entry" = d,
        tabledata "Insurance Register" = d,
        tabledata "Interaction Log Entry" = d,
        tabledata "Intercomp. Entry" = d,
        tabledata "Intercompany Ledger Entry" = d,
        tabledata "Inventory Adjmt. Entry (Order)" = d,
        tabledata "Inventory Period Entry" = d,
        tabledata "Inventory Report Entry" = d,
        tabledata "Item Analysis View Budg. Entry" = d,
        tabledata "Item Analysis View Entry" = d,
        tabledata "Item Application Entry" = d,
        tabledata "Item Budget Entry" = d,
        tabledata "Item Ledger Entry" = d,
        tabledata "Item Register" = d,
        tabledata "Job Ledger Entry" = d,
        tabledata "Job Queue Entry" = d,
        tabledata "Job Queue Log Entry" = d,
        tabledata "Job Register" = d,
        tabledata "Job WIP Entry" = d,
        tabledata "Job WIP G/L Entry" = d,
        tabledata "Leave Ledger Entry (4PS)" = d,
        tabledata "Loan Ledger Entry" = d,
        tabledata "Loaner Entry" = d,
        tabledata "Maintenance Ledger Entry" = d,
        tabledata "No. Series Line" = rm,
        tabledata "Notification Entry" = d,
        tabledata "Opportunity Entry" = d,
        tabledata "Order Tracking Entry" = d,
        tabledata "Overdue Approval Entry" = d,
        tabledata "Parallel Session Entry" = d,
        tabledata "Phys. Inventory Ledger Entry" = d,
        tabledata "Plant Budget Entry" = d,
        tabledata "Plant Ledger Entry" = d,
        tabledata "Plant Rate Component Entry" = d,
        tabledata "Plant Rent Entry" = d,
        tabledata "Plant Register" = d,
        tabledata "Positive Pay Entry" = d,
        tabledata "Post Code Update Log Entry" = d,
        tabledata "Posted Approval Entry" = d,
        tabledata "Production Forecast Entry" = d,
        tabledata "Production Matrix  BOM Entry" = d,
        tabledata "Project Cost Plus Entry" = d,
        tabledata "Project Inventory Entry" = d,
        tabledata "Reminder/Fin. Charge Entry" = d,
        tabledata "Rental Unit M.C. Process Entry" = d,
        tabledata "Requisition Entry" = d,
        tabledata "Res. Capacity Entry" = d,
        tabledata "Res. Ledger Entry" = d,
        tabledata "Reservation Entry" = d,
        tabledata "Retention Policy Setup" = r,
        tabledata "Resource Register" = d,
        tabledata "Reversal Entry" = d,
        tabledata "Salesperson Budget Entry" = d,
        tabledata "Sent Notification Entry" = d,
        tabledata "Service Ledger Entry" = d,
        tabledata "Service Order Cost Plus Entry" = d,
        tabledata "Service-Ledger Entry" = d,
        tabledata "Service-Register" = d,
        tabledata "Service Document Register" = d,
        tabledata "Service Register" = d,
        tabledata "Table Metadata" = r,
        tabledata "Time Sheet Posting Entry" = d,
        tabledata "Value Entry" = d,
        tabledata "User Time Register" = d,
        tabledata "VAT Entry" = d,
        tabledata "VAT Rate Change Log Entry" = d,
        tabledata "Vendor Ledger Entry" = d,
        tabledata "Warehouse Entry" = d,
        tabledata "Warehouse Register" = d,
        tabledata "Warranty Ledger Entry" = d,
        tabledata "Workflow Webhook Entry" = d;

    requestpage
    {
        layout
        {
            area(content)
            {
                field(CompanyNameField; CompanyName)
                {
                    ApplicationArea = All;
                    Caption = 'Clear Company for Current Company';
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Shows the company that will be cleared.';
                }
                group(ImplCompanyGroup)
                {
                    Caption = 'Implementation Company';

                    field(DatabaseAbbreviationField; DatabaseAbbreviation)
                    {
                        ApplicationArea = All;
                        Caption = 'Database Abbreviation';
                        TableRelation = "Impl. Company"."Database Abbreviation";
                        ToolTip = 'Specifies the Implementation Company database abbreviation used to determine which tables to clear.';

                        trigger OnValidate()
                        begin
                            CompanyAbbreviation := '';
                        end;
                    }
                    field(CompanyAbbreviationField; CompanyAbbreviation)
                    {
                        ApplicationArea = All;
                        Caption = 'Company Abbreviation';
                        ToolTip = 'Specifies the Implementation Company abbreviation.';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            ImplCompany: Record "Impl. Company";
                        begin
                            ImplCompany.SetRange("Database Abbreviation", DatabaseAbbreviation);
                            if Page.RunModal(0, ImplCompany) = Action::LookupOK then
                                CompanyAbbreviation := ImplCompany."Company Abbreviation";
                        end;
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    var
        UserPermissions: Codeunit "User Permissions";
    begin
        if not UserPermissions.IsSuper(UserSecurityId()) then
            Error(this.SuperPermissionsRequiredErr);
    end;

    trigger OnPreReport()
    var
        RetentionPolicies: Record "Retention Policy Setup";

    begin
        if (this.DatabaseAbbreviation = '') or (this.CompanyAbbreviation = '') then
            Error(this.ImplCompanyRequiredErr);

        RetentionPolicies.SetRange(Enabled, true);
        if not RetentionPolicies.IsEmpty() then
            Error(this.RetentionPoliciesExistErr);

        this.TotalTableCount := CalculateTotalTableCount();

        if not Confirm(this.ConfirmDeleteDataQst, false, this.TotalTableCount, this.DatabaseAbbreviation, this.CompanyAbbreviation) then
            Error('');

        this.Window.Open(this.ProgressDialogTok);
        Clear(this.StatusCounter);

        ClearSelectedTables();
        ResetAllNoSeries();

        this.Window.Close();
    end;

    local procedure CalculateTotalTableCount(): Integer
    var
        ImplCompanyTable: Record "Impl. Company Table";
    begin
        ImplCompanyTable.SetRange("Database Abbreviation", this.DatabaseAbbreviation);
        ImplCompanyTable.SetRange("Company Abbreviation", this.CompanyAbbreviation);
        ImplCompanyTable.SetFilter("Defined Table Type", 'Transaction|Not Applicable');
        exit(ImplCompanyTable.Count());
    end;

    local procedure ClearSelectedTables()
    var
        ImplCompanyTable: Record "Impl. Company Table";
    begin
        ImplCompanyTable.SetRange("Database Abbreviation", this.DatabaseAbbreviation);
        ImplCompanyTable.SetRange("Company Abbreviation", this.CompanyAbbreviation);
        ImplCompanyTable.SetFilter("Defined Table Type", 'Transaction|Not Applicable');
        if ImplCompanyTable.FindSet() then
            repeat
                this.StatusCounter += 1;
                UpdateProgress(Format(ImplCompanyTable."Table ID"), ImplCompanyTable."Table Caption");
                CleanTable(ImplCompanyTable."Table ID");
            until ImplCompanyTable.Next() = 0;

        SelectLatestVersion();
    end;

    local procedure CleanTable(TableNo: Integer)
    var
        LocalTableMeta: Record "Table Metadata";
        RecRef: RecordRef;
    begin
        if not LocalTableMeta.Get(TableNo) then
            exit;

        RecRef.Open(TableNo);
        if not RecRef.IsEmpty() then
            RecRef.DeleteAll(false);
        RecRef.Close();
    end;

    local procedure ResetAllNoSeries()
    var
        NoSeriesLine: Record "No. Series Line";
    begin
        if NoSeriesLine.FindSet(true) then
            repeat
                NoSeriesLine."Last No. Used" := '';
                NoSeriesLine.Modify();
            until NoSeriesLine.Next() = 0;
    end;

    local procedure UpdateProgress(TableNo: Text; TableName: Text)
    begin
        if this.TotalTableCount > 0 then
            this.Window.Update(1, Round(this.StatusCounter / this.TotalTableCount * 10000, 1));
        this.Window.Update(2, StrSubstNo(this.ProgressTableTok, TableNo, TableName));
    end;

    procedure SetImplCompany(NewDatabaseAbbreviation: Text[30]; NewCompanyAbbreviation: Text[30])
    begin
        this.DatabaseAbbreviation := NewDatabaseAbbreviation;
        this.CompanyAbbreviation := NewCompanyAbbreviation;
    end;

    var
        Window: Dialog;
        DatabaseAbbreviation: Text[30];
        CompanyAbbreviation: Text[30];
        StatusCounter: Integer;
        TotalTableCount: Integer;
        ImplCompanyRequiredErr: Label 'You must specify an Implementation Company (Database Abbreviation and Company Abbreviation) before running this report.';
        SuperPermissionsRequiredErr: Label 'You must have SUPER permissions to run this report.';
        RetentionPoliciesExistErr: Label 'You must deactivate all Retention Policies before running this report.';
        ConfirmDeleteDataQst: Label 'You are about to delete all records from %1 tables (type Transaction and Not Applicable) in Implementation Company %2 / %3.\\This action cannot be undone.\\Are you sure you want to continue?', Comment = '%1 = Number of tables, %2 = Database Abbreviation, %3 = Company Abbreviation';
        ProgressDialogTok: Label '@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\#2################################################', Locked = true;
        ProgressTableTok: Label 'Table %1 %2', Locked = true;
}
