; ModuleID = 'temp.c'
source_filename = "temp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { double, i32*, [100 x i32*] }

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32**, align 8
  %c = alloca i32*, align 8
  %bar = alloca %struct.foo, align 8
  store i32 10, i32* %a, align 4
  store i32* %a, i32** %c, align 8
  store i32** %c, i32*** %b, align 8
  %0 = load i32**, i32*** %b, align 8
  %incdec.ptr = getelementptr inbounds i32*, i32** %0, i32 -1
  store i32** %incdec.ptr, i32*** %b, align 8
  %1 = load i32*, i32** %c, align 8
  %b1 = getelementptr inbounds %struct.foo, %struct.foo* %bar, i32 0, i32 1
  store i32* %1, i32** %b1, align 8
  %2 = load i32*, i32** %c, align 8
  %c2 = getelementptr inbounds %struct.foo, %struct.foo* %bar, i32 0, i32 2
  %arrayidx = getelementptr inbounds [100 x i32*], [100 x i32*]* %c2, i64 0, i64 23
  store i32* %2, i32** %arrayidx, align 8
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://github.com/llvm-mirror/clang.git 2f5a0f873a9cfe147b84c758d17f660b887881f6) (https://github.com/llvm-mirror/llvm.git a7c4539a027bf0b38280fe3cbb19fcb88026517c)"}
