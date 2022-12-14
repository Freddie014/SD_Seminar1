table 50119 "CSD Posted Seminar Reg. Line"
{
    // CSD1.00 - 2022 Oct 8 - D. E. Veloper
    
    Caption = 'Posted Seminar Registration Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "CSD Seminar Reg. Header";
            DataClassification = AccountData;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = AccountData;
        }
        field(3; "Bill-to Customer No."; Code[20])
        {
            TableRelation = Customer;
            Caption = 'Bill-to Customer No.';
            DataClassification = AccountData;

        }
        field(4; "Participant Contact No."; Code[20])
        {
            TableRelation = Contact;
            Caption = 'Participant Contact No.';
            DataClassification = AccountData;

        }
        field(5; "Participant Name"; Text[100])
        {
            Caption = 'Participant Name';
            CalcFormula = Lookup (Contact.Name where ("No." = Field ("Participant Contact No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
            Editable = false;
            DataClassification = AccountData;
        }
        field(7; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            InitValue = true;
            DataClassification = AccountData;
        }
        field(8; Participated; Boolean)
        {
            Caption = 'Participated';
            DataClassification = AccountData;
        }
        field(9; "Confirmation Date"; Date)
        {
            Caption = 'Confirmation Date';
            Editable = false;
            DataClassification = AccountData;
        }
        field(10; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 2;
            DataClassification = AccountData;

        }
        field(11; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
            DataClassification = AccountData;

        }
        field(12; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            AutoFormatType = 1;
            DataClassification = AccountData;

        }
        field(13; Amount; Decimal)
        {
            Caption = 'Amount';
            AutoFormatType = 1;
            DataClassification = AccountData;
        }
        field(14; Registered; Boolean)
        {
            Caption = 'Registered';
            Editable = false;
            DataClassification = AccountData;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
        }
    }

   
}

