namespace RISA.DataEditorTools.DataEditor;

using Fps.BaseApplication.ImplementationControl.ImplCompany;

pageextension 50312 "RISA DET Impl.Proc.Ctrl.Main" extends "Impl. Process Contr. Main"
{
    actions
    {
        addlast(Processing)
        {
            action(RISADETClearCompany)
            {
                ApplicationArea = All;
                Caption = 'Clear Company';
                Image = ClearLog;
                ToolTip = 'Clears all transactional data from the company based on the Implementation Company table definitions.';

                trigger OnAction()
                var
                    ClearCompanyReport: Report "RISA DET Clear Company";
                begin
                    if Rec."Database Company" <> CompanyName() then
                        Error('Please switch to the company you want to clear before running this action.');

                    ClearCompanyReport.SetImplCompany(Rec."Database Abbreviation", Rec."Company Abbreviation");
                    ClearCompanyReport.RunModal();
                end;
            }
        }
    }
}
