page 50102 "CSD Seminar List"

// CSD1.00 - 2018-01-01 - D. E. Veloper

// Chapter 5 - Lab 2-6

{
    Caption='Seminar List';
    PageType = List;
    Editable = false;
    CardPageId = 50101;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar";
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    
                }

                field(Name; Name)
                {

                }

                field("Seminar Duration";"Seminar Duration")
                {

                }

                field("Seminar Price";"Seminar Price")
                {

                }

                field("Minimum Participants";"Minimum Participants")
                {

                }

                field("Maximum Participants";"Maximum Participants")
                {

                }
            }
        }
        area(Factboxes)
        {

            systempart("Links";Links)
            {

            }

            systempart("Notes"; Notes)
            {

            }
            
        }
    }
    
    actions
    {
        area(Navigation)
        {

        group("&Seminar")
        {
            action("Co&mments")
            {
                RunObject=page "CSD Seminar Comment Sheet";

                RunPageLink = "Table
                Name"=const(Seminar),"No."=field("No.");

                Image = Comment;
            }
        }
            
        }
    }
}