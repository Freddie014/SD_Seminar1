/// <summary>
/// Table CSD Seminar Setup (ID 50100).
/// </summary>
table 50100 "CSD Seminar Setup"

//CSD1.00 - 2018-01-01- D.E.Veloper

//Chapter 5 - Lab 2-1

{
    Caption = 'Seminar Setup';

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            trigger OnValidate();
            begin

                if "No." <> xRec."No." then begin
                    SeminarSetup.Get();

                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos");

                    "No. Series" := '';
                end;
            end;
        }
        field(11; "No."; Code[20])
        {

        }


        field(12; "No. Series"; Code[20])
        {

        }

        field(13; "Last Date Modified"; Date)
        {

        }

        field(24; "Search Name"; Code[20])
        {
            trigger OnValidate();

            begin
                if ("Search Name" = UpperCase(xRec.Name)) or

                ("Search Name" = '') then
                    "Search Name" := Name;

            end;

        }

        field(25; "Name"; Code[20])
        {

        }

        field(40; "Posted Seminar Reg. Nos"; Code[20])
        {

            Caption = 'Posted Seminar Reg. Nos';

            TableRelation = "No. Series";
        }


        field(20; "Seminar Nos"; Code[20])
        {

            Caption = 'Seminar Nos';

            TableRelation = "No. Series";
        }

        field(30; "Seminar Registraion Nos"; Code[20])
        {

            Caption = 'Seminar Registration Nos';

            TableRelation = "No. Series";
        }

        field(45; "Gen. Prod. Posting Group"; Code[20])
        {

            Caption = 'Gen. Prod. Posting Group';
            trigger OnValidate();

        begin

        if (xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin

            if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "Gen. Prod. Posting Group") then
                Validate("VAT. Prod. Posting Group",GenProdPostingGroup."Def. VAT Prod. Posting Group");

        end;

        end;

            //TableRelation = "No. Series";
        }

        field(55; "VAT. Prod. Posting Group"; Code[20])
        {

            Caption = 'VAT. Prod. Posting Group';
            

            //TableRelation = "No. Series";
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        SeminarSetup: Record "CSD Seminar Setup";
        //CommentLine : record "CSD seminar Comment Line";

        Seminar: Record "CSD Seminar";

        GenProdPostingGroup: Record "Gen. Product Posting Group";

        NoSeriesMgt: Codeunit NoSeriesManagement;
    ////myInt: Integer;

    trigger OnInsert();

    begin
        if "No." = '' then begin
            SeminarSetup.get;

            SeminarSetup.TestField("Seminar Nos");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();

    begin

        "Last Date Modified" := Today;

    end;

    trigger OnDelete();

    begin
        //CommentLine.Reset;

        //CommentLine.SetRange("Table Name",

        //CommentLine."Table Name"::Seminar);

        //CommentLine.SetRange("No.","No.");

        // CommentLine.DeleteAll;
    end;

    trigger OnRename();

    begin

        "Last Date Modified" := Today;

    end;






    
}