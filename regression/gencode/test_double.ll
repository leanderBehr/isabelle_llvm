; Generated by Isabelle/LLVM-shallow
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"



declare double @llvm.sqrt.f64(double)


define double @test_double(double %a, double %b) {

  start:
    %aa = fmul double %a, %a
    %bb = fmul double %b, %b
    %t_1 = fadd double %aa, %bb
    %t_11 = call double @llvm.sqrt.f64 (double %t_1)
    %t_2 = fdiv double %a, %b
    %t_12 = fsub double %t_11, %t_2
    %x = fadd double %a, %b
    %x1 = frem double %t_12, %x
    ret double %x1
}