use std::env;
use std::path::PathBuf;
use tonic_build::configure;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let proto_file = "./proto/wavenet.proto";
    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());

    configure()
        .protoc_arg("--experimental_allow_proto3_optional") // for older systems
        .build_client(true)
        .build_server(true)
        .file_descriptor_set_path(out_dir.join("store_descriptor.bin"))
        .out_dir("./src/proto")
        .compile(&[proto_file], &["proto"])?;

    Ok(())
}
