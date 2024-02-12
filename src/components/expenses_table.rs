use dioxus::prelude::*;
use dioxus_sortable::{use_sorter, PartialOrdBy, SortBy, Sortable, Th};

#[derive(Clone, Debug, PartialEq)]
struct Expense {
    desc: String,
    amount: u32,
    date: u64,
}

#[derive(Copy, Clone, Debug, Default, PartialEq)]
enum ExpenseField {
    Desc,
    Amount,
    #[default]
    Date,
}

impl PartialOrdBy<Expense> for ExpenseField {
    fn partial_cmp_by(&self, a: &Expense, b: &Expense) -> Option<std::cmp::Ordering> {
        match self {
            ExpenseField::Desc => a.desc.partial_cmp(&b.desc),
            ExpenseField::Amount => a.amount.partial_cmp(&b.amount),
            ExpenseField::Date => a.date.partial_cmp(&b.date),
        }
    }
}

impl Sortable for ExpenseField {
    fn sort_by(&self) -> Option<SortBy> {
        SortBy::increasing_or_decreasing()
    }
}

#[component]
pub fn ExpensesTable(cx: Scope) -> Element {
    let sorter = use_sorter::<ExpenseField>(cx);

    let mut data = vec![
        Expense {
            desc: "a".to_string(),
            amount: 10,
            date: 1,
        },
        Expense {
            desc: "b".to_string(),
            amount: 20,
            date: 2,
        },
    ];

    sorter.sort(data.as_mut_slice());

    render! (
        div {
           table {
                thead {
                    tr {
                        Th { sorter: sorter, field: ExpenseField::Desc, "Desc" }
                        Th { sorter: sorter, field: ExpenseField::Amount, "Amount" }
                        Th { sorter: sorter, field: ExpenseField::Date, "Date" }
                    }
                }
                tbody {
                   for expense in data.iter() {
                        tr {
                            td { "{expense.desc}" }
                            td { "{expense.amount}" }
                            td { "{expense.date}" }
                        }
                    } 
                }
            } 
        }
    ) 
}
