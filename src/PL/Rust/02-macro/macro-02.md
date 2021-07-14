```rust
macro_rules! prr {
    () => {
        println!("()")
    };

    ($($arg:expr)*) => {
        println!("{}", ($($arg)*) );
    };
    ($($arg:tt)*) => {
        println!("{:?}", ($($arg)*) );
    };
}

fn main() {
    prr!({
        let a = 9;
        a
    });

    let a = 0.9;
    prr!(a, 9, 12, 97);
}


```
