use dioxus::prelude::*;

mod components;

use components::*;

pub fn app(cx: Scope) -> Element {
    render! {
        div {
            display: "flex",
            flex_direction: "column",
            TopBar {}
            div {
                padding_top: "42px",
                ExpensesInput {}
                ExpensesTable {}
            }
        }
    }
}

fn main() {
    dioxus_desktop::launch(app);
}
