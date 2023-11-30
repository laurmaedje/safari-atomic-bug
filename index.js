async function main() {
  const memory = new WebAssembly.Memory({
    initial: 1,
    maximum: 1,
    shared: true,
  });

  const response = fetch("bug.wasm");
  const module = await WebAssembly.compileStreaming(response);
  const instance = await WebAssembly.instantiate(module, {
    env: { memory },
  });
  console.log(instance.exports.demo());
}

main();
