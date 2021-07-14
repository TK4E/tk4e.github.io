```rust,editable
use std::{
    env::{temp_dir, var},
    fs::File,
    io::Read,
    process::Command,
};

fn main() {
    let editor = var("EDITOR").unwrap();
    let mut file_path = temp_dir();
    file_path.push("editable");
    File::create(&file_path).expect("Could not create file");

    Command::new(editor)
        .arg(&file_path)
        .status()
        .expect("Something went wrong");

    let mut editable = String::new();
    File::open(file_path)
        .expect("Could not open file")
        .read_to_string(&mut editable);

    println!("File content:\n{}", editable);
}

```
