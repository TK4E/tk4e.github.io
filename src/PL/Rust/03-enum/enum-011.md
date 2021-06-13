```rust
#[derive(Debug)]
enum Something {
    A { size: u32, name: String },
    B { size: u32, switch: bool },
}

impl Something {
    fn size(&self) -> u32 {
        match self {
            Something::A { size, .. } => *size,
            Something::B { size, .. } => *size,
        }
    }

    fn name(&self) -> &String {
        match self {
            Something::A { name, .. } => name,
            Something::B { .. } => panic!("Something::B doesn't have name field"),
        }
    }

    fn switch(&self) -> bool {
        match self {
            Something::A { .. } => panic!("Something::A doesn't have switch field"),
            Something::B { switch, .. } => *switch,
        }
    }

    fn new_size(&self, size: u32) -> Something {
        match self {
            Something::A { name, .. } => Something::A {
                size,
                name: name.clone(),
            },
            Something::B { switch, .. } => Something::B {
                size,
                switch: *switch,
            },
        }
    }

    // etc...
}

fn main() {
    let a = Something::A {
        size: 1,
        name: "Rust is not haskell".to_string(),
    };
    println!("{:?}", a.size());
    println!("{:?}", a.name());

    let b = Something::B {
        size: 1,
        switch: true,
    };
    println!("{:?}", b.switch());

    let aa = a.new_size(2);
    println!("{:?}", aa);
}

```
