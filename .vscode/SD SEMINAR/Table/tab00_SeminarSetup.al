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

        field(40; "Posted Seminar Reg. Nos"; Code[20])
        {

            Caption = 'Posted Seminar Reg. Nos';

            TableRelation = "No. Series";
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

            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
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

    trigger OnValidate();

    begin

        if "No." <> xRec."No." then begin
            SeminarSetup.Get();

            NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");

            "No. Series" := '';
        end;
    end;


    trigger OnValidate();

    begin
        if ("Search Name" = UpperCase(xRec.Name)) or

        ("Search Name" := '') then

        "Search Name" := Name;

    end;

    trigger OnValidate();

    begin

        if (xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin

            if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "Gen. Prod. Posting Group") then
                Validate("VAT Prod. Posting Group",

                GenProdPostingGroup."Def. VAT Prod. Posting Group");

        end;

    end;
}