page 50107 "CSD Seminar Comment List"

{
    Caption = 'Seminar Comment Line';
    Editable = false;
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Date; Date)
                {

                }

                field(Code; Code)
                {
                    Visible = false;
                }

                field(Comment; Comment)
                {

                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}