use dioxus::prelude::*;

pub fn app(cx: Scope) -> Element {
    render! {
        div {
            "Nya :3"
        }
    }
}

fn main() {
    dioxus_desktop::launch(app);
}
