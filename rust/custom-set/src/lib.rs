pub struct CustomSet<T> {
    collection: Vec<T>
}

impl <T> CustomSet<T> {
    pub fn new() -> CustomSet<T> {
        CustomSet { collection: Vec::new() }
    }

    pub fn len(&self) -> usize {
        0
    }

    pub fn is_empty(&self) -> bool {
        true
    }
}
