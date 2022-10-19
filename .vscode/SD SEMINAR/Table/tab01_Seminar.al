table 50101 "CSD Seminar"

// CSD1.00 - 2018-01-01 - D. E. Veloper

// Chapter 5 - Lab 2-2

{
    Caption = 'Seminar';
    LookupPageId = 50102;

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
        }

        field(20; Name; Code[50])
        {
            Caption = 'Name';
        }

        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }

        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
        }

        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
        }

        field(60; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }

        field(70; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }

        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }

        field(90; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            //FieldClass=FlowField;
            //CalcFormula=exist("Seminar Comment Line" 
            //where("Table Name"= const("Seminar"), 
            // "No."=Field("No.")));
        }

        field(100; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }

        field(110; "Gen. Prod. Posting Group"; code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }

        field(120; "VAT Prod. Posting Group"; code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }

        field(130; "No. Series"; Code[10])
        {
            Editable = false;
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }


    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key1; "Search Name")
        {

        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
procedure AssistEdit() : Boolean;

begin
    with Seminar do begin
        
        Seminar:=Rec;

        SeminarSetup.get;

        SeminarSetup.TestField("Seminar Nos.");

        if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos."
        
        ,xRec. "No. Series","No. Series") then begin
            NoSeriesMgt.SetSeries("No.");

            Rec:=Seminar;

            exit(true);


        end

    end;
end;