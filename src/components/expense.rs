use dioxus_sortable::{PartialOrdBy, SortBy, Sortable};
use chrono::DateTime;

#[derive(Clone, Debug, PartialEq)]
pub struct Expense {
    pub desc: String,
    pub amount: u32,
    pub date: DateTime<chrono::Utc>,
}

#[derive(Copy, Clone, Debug, Default, PartialEq)]
pub enum ExpenseField {
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
