use dioxus::prelude::*;
use super::expense::*;

#[component]
pub fn ExpensesInput(cx: Scope) -> Element {
    render! (
        div {
            form {
                onsubmit: move |e| {
                    let values = e.data.values.clone();
                    let desc = values
                        .get("desc")
                        .unwrap()
                        .get(0)
                        .unwrap();
                    let amount = values
                        .get("amount")
                        .unwrap()
                        .get(0)
                        .unwrap();
                    let date = values
                        .get("date")
                        .unwrap()
                        .get(0)
                        .unwrap();
                    let expense = Expense {
                        desc: desc.parse().unwrap(),
                        amount: amount.parse().unwrap(),
                        date: chrono::DateTime::parse_from_str(format!("{} 00 00 +0000", date).as_str(), "%Y-%m-%d %H %M %z").unwrap().into(),
                    };
                    println!("{:?}", expense);
                 },
                label { "for": "expdesc", "Description" }
                input { name: "desc", id: "expdesc" },
                br {}
                label { "for": "expamount", "Amount" }
                input { name: "amount", id: "expamount" },
                br {}
                label { "for": "expdate", "Date" }
                input { name: "date", "type": "date", id: "expdate" },
                br {}
                input { r#type: "submit", },
            }
        }
    ) 
}
