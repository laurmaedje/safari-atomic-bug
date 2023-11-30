(module
  (import "env" "memory" (memory 1 1 shared))
  (func $demo (result i32)
    (i32.atomic.rmw.cmpxchg   ;; overwrite memory slot 0 if it is zero
      (i32.const 0)           ;; address
      (i32.const 0)           ;; current
      (i32.const 2147483648)) ;; new
    drop                      ;; ignore output
    (i32.atomic.rmw.cmpxchg   ;; overwrite memory slot 0 if it is 2147483648
      (i32.const 0)           ;; address
      (i32.const 2147483648)  ;; current
      (i32.const 1))          ;; new
    drop                      ;; ignore output
    i32.const 0               ;; address
    i32.load                  ;; read memory slot 0
  )
  (export "demo" (func $demo))
)
