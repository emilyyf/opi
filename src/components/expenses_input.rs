use dioxus::prelude::*;

#[component]
pub fn ExpensesInput(cx: Scope) -> Element {
    let amount = use_state(cx, || "0".to_string());

    render! (
        div {
            p { "Amount" }
            input {
                value: "{amount}",
                oninput: move |e| amount.set(e.value.clone()),
            }
            input {
                "type": "date",
                oninput: move |e| println!("{:?}", e.value.clone()),
            }
        }
    ) 
}
