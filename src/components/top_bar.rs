use dioxus::{html::GlobalAttributes, prelude::*};

#[component]
pub fn TopBar(cx: Scope) -> Element {
    render! (
        div {
            background_color: "blue",
            color: "white",
            position: "absolute",
            padding: "0",
            height: "42px",
            top: "0",
            left: "0",
            width: "100%",
            display: "flex",
            justify_content: "center",
            Menu {}
        }
    )
}

#[component]
fn Title(cx: Scope) -> Element {
    render!(
        p {
            border: "none",
            align_self: "flex-start",
            "Opi"
        }
    )
}

#[component]
fn Menu(cx: Scope) -> Element {
    render!(
        div {
            padding_right: "5px",
            overflow: "hidden",
            align_self: "center",
            button {
                "Home"
            }
            button {
                "Settings"
            }
        }
    )
}
