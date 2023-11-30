# Safari WebAssembly atomics compare exchange bug
```bash
wat2wasm --enable-threads bug.wat
npx serve
```

Chrome/Firefox output:
```
1
```

Safari output:
```
-2147483648
```

The `atomic.rmw.cmpxchg` family of instructions don't seem to work when the
current value to check for has the highest bit set. If the highest bit isn't
set, they work as expected.
