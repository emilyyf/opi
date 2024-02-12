use dioxus::prelude::*;
use dioxus_sortable::{use_sorter, Th};
use chrono::DateTime;
use super::expense::*;

#[component]
pub fn ExpensesTable(cx: Scope) -> Element {
    let sorter = use_sorter::<ExpenseField>(cx);

    let mut data = vec![
        Expense {
            desc: "a".to_string(),
            amount: 10,
            date: DateTime::from_timestamp(1, 0).unwrap(),
        },
        Expense {
            desc: "b".to_string(),
            amount: 20,
            date: DateTime::from_timestamp(2, 0).unwrap(),
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
