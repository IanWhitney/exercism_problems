pub struct CustomSet<T> {
    collection: Vec<T>
}

impl <T: PartialEq + Clone> CustomSet<T> {
    pub fn new() -> CustomSet<T> {
        CustomSet { collection: Vec::new() }
    }

    pub fn len(&self) -> usize {
        self.collection.len()
    }

    pub fn insert(&mut self, element: T) {
        if !self.contains(&element) {
            self.collection.push(element)
        }
    }

    pub fn is_empty(&self) -> bool {
        self.collection.is_empty()
    }

    pub fn contains(&self, other: &T) -> bool {
        self.collection.contains(other)
    }

    pub fn is_disjoint(&self, other: &Self) -> bool {
        !self.collection.iter().any(|x| other.contains(x))
    }

    pub fn is_subset(&self, other: &Self) -> bool {
        self.collection.iter().all(|x| other.contains(x))
    }

    pub fn is_superset(&self, other: &Self) -> bool {
        other.is_subset(&self)
    }

    pub fn difference(&self, other: &Self) -> Vec<T> {
        let mut s =  Vec::new();
        for element in self.collection.iter() {
            if !other.contains(element){
                s.push(element.clone());
            }
        }
        s
    }
}
