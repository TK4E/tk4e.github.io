```rust
fn main() {
    let a = 1;
    macro_rules! test {
        ($x: block $(, $o: expr)*) => {
            println!("{} && {} ", $x, $($o)*);
        };
    }

    let a = 9;
    test!(
        {
            let q = 0;
            q + 1
        },
        a
    );
}

```

