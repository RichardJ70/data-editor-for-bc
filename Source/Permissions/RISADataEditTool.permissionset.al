permissionset 81000 "RISA Data Edit Tool"
{
    Assignable = true;
    Caption = 'Data Editor Tool';
    Permissions = tabledata "RISA DET Binary Data Buffer"=RIMD,
        tabledata "RISA DET Data Editor Buffer"=RIMD,
        tabledata "RISA DET Data Editor Log"=RIMD,
        tabledata "RISA DET Data Editor Setup"=RIMD,
        tabledata "RISA DET Field"=RIMD,
        tabledata "RISA DET Find and Replace"=RIMD,
        tabledata "RISA DET Query Preset"=RIMD,
        table "RISA DET Binary Data Buffer"=X,
        table "RISA DET Data Editor Buffer"=X,
        table "RISA DET Data Editor Log"=X,
        table "RISA DET Data Editor Setup"=X,
        table "RISA DET Field"=X,
        table "RISA DET Find and Replace"=X,
        table "RISA DET Query Preset"=X,
        codeunit "RISA DET Data Editor Mgt."=X,
        codeunit "RISA DET Read Data Batch"=X,
        codeunit "RISA DET Single Inst. Storage"=X,
        page "RISA DET Data Editor"=X,
        page "RISA DET Data Editor Buffer"=X,
        page "RISA DET Data Editor Log"=X,
        page "RISA DET Data Editor Setup"=X,
        page "RISA DET Edit Value"=X,
        page "RISA DET Find and Replace"=X,
        page "RISA DET Import/Export Dialog"=X,
        page "RISA DET Insert New Record"=X,
        page "RISA DET Key"=X,
        page "RISA DET Query Preset"=X,
        page "RISA DET Run Edit From Filter"=X,
        page "RISA DET Select Fields"=X;
}