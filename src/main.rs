use dioxus::prelude::*;

mod components;

use components::*;

pub fn app(cx: Scope) -> Element {
    render! {
        div {
            TopBar {}
            ExpensesInput {}
            ExpensesTable {}
        }
    }
}

fn main() {
    dioxus_desktop::launch(app);
}
