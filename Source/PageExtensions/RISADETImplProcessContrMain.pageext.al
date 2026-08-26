namespace RISA.DataEditorTools.DataEditor;

using Fps.BaseApplication.ImplementationControl.ImplCompany;
using System.Security.User;

pageextension 50412 "RISA DET Impl.Proc.Ctrl.Main" extends "Impl. Process Contr. Main"
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
                Visible = IsSuperUser;
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

    trigger OnOpenPage()
    begin
        CheckSuperUser();
    end;

    local procedure CheckSuperUser(): Boolean
    var
        UserPermissions: Codeunit "User Permissions";

    begin
        IsSuperUser := UserPermissions.IsSuper(UserSecurityId());
    end;

    var
        IsSuperUser: Boolean;
}
