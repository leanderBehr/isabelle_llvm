; Generated by Isabelle/LLVM-shallow
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"






define i32 @euclid(i32 %a, i32 %b) {

  start:
    %x = insertvalue { i32, i32 } zeroinitializer, i32 %a, 0
    %xa = insertvalue { i32, i32 } %x, i32 %b, 1
    br label %while_start

  while_start:
    %xb = phi { i32, i32 } [ %x6, %ctd_if ], [ %xa, %start ]
    %a1 = extractvalue { i32, i32 } %xb, 0
    %x1 = extractvalue { i32, i32 } %xb, 1
    %x2 = icmp ne i32 %a1, %x1
    br i1 %x2, label %while_body, label %while_end

  while_body:
    %a2 = extractvalue { i32, i32 } %xb, 0
    %b1 = extractvalue { i32, i32 } %xb, 1
    %tmpa = icmp ule i32 %a2, %b1
    br i1 %tmpa, label %then, label %else

  then:
    %xaa = insertvalue { i32, i32 } zeroinitializer, i32 %a2, 0
    %x3 = sub i32 %b1, %a2
    %x4 = insertvalue { i32, i32 } %xaa, i32 %x3, 1
    br label %ctd_if

  else:
    %xc = sub i32 %a2, %b1
    %xaa1 = insertvalue { i32, i32 } zeroinitializer, i32 %xc, 0
    %x5 = insertvalue { i32, i32 } %xaa1, i32 %b1, 1
    br label %ctd_if

  ctd_if:
    %x6 = phi { i32, i32 } [ %x5, %else ], [ %x4, %then ]
    br label %while_start

  while_end:
    %a3 = extractvalue { i32, i32 } %xb, 0
    %b2 = extractvalue { i32, i32 } %xb, 1
    ret i32 %a3
}
