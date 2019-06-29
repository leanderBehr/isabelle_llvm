; Generated by Isabelle/LLVM-shallow
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"



declare void @isabelle_llvm_free(i8*)
declare i8* @isabelle_llvm_calloc(i64, i64)


define void @LLVM_DS_Array_arraycpy(i64* %dst, i64* %src, i64 %n) {

  start:
    br label %while_start

  while_start:
    %i = phi i64 [ %x1, %while_body ], [ 0, %start ]
    %x = icmp ult i64 %i, %n
    br i1 %x, label %while_body, label %while_end

  while_body:
    %xa = getelementptr i64, i64* %src, i64 %i
    %xaa = load i64, i64* %xa
    %p = getelementptr i64, i64* %dst, i64 %i
    store i64 %xaa, i64* %p
    %x1 = add i64 %i, 1
    br label %while_start

  while_end:
    ret void
}

define { i64, { i64, i64* } } @sort({ i64, { i64, i64* } } %x) {

  start:
    %tmpd = icmp eq i64 8, 0
    br i1 %tmpd, label %then, label %else

  then:
    br label %ctd_if

  else:
    %t = getelementptr i64, i64* null, i64 1
    %a = ptrtoint i64* %t to i64
    %b = call i8* @isabelle_llvm_calloc (i64 8, i64 %a)
    %x1 = bitcast i8* %b to i64*
    br label %ctd_if

  ctd_if:
    %aa = phi i64* [ %x1, %else ], [ null, %then ]
    %xb = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 0, 0
    %xc = insertvalue { i64, i64* } zeroinitializer, i64 8, 0
    %xd = insertvalue { i64, i64* } %xc, i64* %aa, 1
    %xaa = insertvalue { i64, { i64, i64* } } %xb, { i64, i64* } %xd, 1
    %xe = insertvalue { i64, { i64, { i64, i64* } } } zeroinitializer, i64 0, 0
    %xf = insertvalue { i64, { i64, { i64, i64* } } } %xe, { i64, { i64, i64* } } %xaa, 1
    br label %while_start

  while_start:
    %xba = phi { i64, { i64, { i64, i64* } } } [ %x7, %ctd_ifa ], [ %xf, %ctd_if ]
    %a1 = extractvalue { i64, { i64, { i64, i64* } } } %xba, 0
    %a2 = extractvalue { i64, { i64, { i64, i64* } } } %xba, 1
    %l = extractvalue { i64, { i64, i64* } } %x, 0
    %xca = extractvalue { i64, { i64, i64* } } %x, 1
    %ca = extractvalue { i64, i64* } %xca, 0
    %aaa = extractvalue { i64, i64* } %xca, 1
    %xea = icmp slt i64 %a1, %l
    %x2 = and i1 %xea, 1
    br i1 %x2, label %while_body, label %while_end

  while_body:
    %a11 = extractvalue { i64, { i64, { i64, i64* } } } %xba, 0
    %a21 = extractvalue { i64, { i64, { i64, i64* } } } %xba, 1
    %l1 = extractvalue { i64, { i64, i64* } } %x, 0
    %xca1 = extractvalue { i64, { i64, i64* } } %x, 1
    %ca1 = extractvalue { i64, i64* } %xca1, 0
    %aa1 = extractvalue { i64, i64* } %xca1, 1
    %xda = getelementptr i64, i64* %aa1, i64 %a11
    %xea1 = load i64, i64* %xda
    %la = extractvalue { i64, { i64, i64* } } %a21, 0
    %xfa = extractvalue { i64, { i64, i64* } } %a21, 1
    %cb = extractvalue { i64, i64* } %xfa, 0
    %ab = extractvalue { i64, i64* } %xfa, 1
    %lc = add i64 %la, 1
    %ld = extractvalue { i64, { i64, i64* } } %a21, 0
    %xga = extractvalue { i64, { i64, i64* } } %a21, 1
    %cc = extractvalue { i64, i64* } %xga, 0
    %ac = extractvalue { i64, i64* } %xga, 1
    %cok = icmp sle i64 %lc, %cc
    br i1 %cok, label %thena, label %elsea

  thena:
    %xh = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %ld, 0
    %xj = insertvalue { i64, i64* } zeroinitializer, i64 %cc, 0
    %x3 = insertvalue { i64, i64* } %xj, i64* %ac, 1
    %x4 = insertvalue { i64, { i64, i64* } } %xh, { i64, i64* } %x3, 1
    br label %ctd_ifa

  elsea:
    %xh1 = insertvalue { i64, i64* } zeroinitializer, i64 %cc, 0
    %tmpgb = insertvalue { i64, i64* } %xh1, i64* %ac, 1
    %xj1 = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %ld, 0
    %x5 = insertvalue { i64, { i64, i64* } } %xj1, { i64, i64* } %tmpgb, 1
    %x6 = call { i64, { i64, i64* } } @LLVM_DS_Array_List_arl_resize (i64 %lc, { i64, { i64, i64* } } %x5)
    br label %ctd_ifa

  ctd_ifa:
    %al = phi { i64, { i64, i64* } } [ %x6, %elsea ], [ %x4, %thena ]
    %le = extractvalue { i64, { i64, i64* } } %al, 0
    %xh2 = extractvalue { i64, { i64, i64* } } %al, 1
    %cd = extractvalue { i64, i64* } %xh2, 0
    %ad = extractvalue { i64, i64* } %xh2, 1
    %p = getelementptr i64, i64* %ad, i64 %le
    store i64 %xea1, i64* %p
    %lf = add i64 %le, 1
    %xja = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lf, 0
    %xk = insertvalue { i64, i64* } zeroinitializer, i64 %cd, 0
    %xl = insertvalue { i64, i64* } %xk, i64* %ad, 1
    %xka = insertvalue { i64, { i64, i64* } } %xja, { i64, i64* } %xl, 1
    %lg = extractvalue { i64, { i64, i64* } } %xka, 0
    %xla = extractvalue { i64, { i64, i64* } } %xka, 1
    %ce = extractvalue { i64, i64* } %xla, 0
    %ae = extractvalue { i64, i64* } %xla, 1
    %xn = call { i64, { i64, i64* } } @IICF_Impl_Heap_h_swim_impl ({ i64, { i64, i64* } } %xka, i64 %lg)
    %xoa = add i64 %a11, 1
    %xp = insertvalue { i64, { i64, { i64, i64* } } } zeroinitializer, i64 %xoa, 0
    %x7 = insertvalue { i64, { i64, { i64, i64* } } } %xp, { i64, { i64, i64* } } %xn, 1
    br label %while_start

  while_end:
    %tmpk = icmp eq i64 8, 0
    br i1 %tmpk, label %thenb, label %elseb

  thenb:
    br label %ctd_ifb

  elseb:
    %ta = getelementptr i64, i64* null, i64 1
    %c = ptrtoint i64* %ta to i64
    %d = call i8* @isabelle_llvm_calloc (i64 8, i64 %c)
    %x8 = bitcast i8* %d to i64*
    br label %ctd_ifb

  ctd_ifb:
    %aa2 = phi i64* [ %x8, %elseb ], [ null, %thenb ]
    %xca2 = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 0, 0
    %xj2 = insertvalue { i64, i64* } zeroinitializer, i64 8, 0
    %xk1 = insertvalue { i64, i64* } %xj2, i64* %aa2, 1
    %xda1 = insertvalue { i64, { i64, i64* } } %xca2, { i64, i64* } %xk1, 1
    %ab1 = extractvalue { i64, { i64, { i64, i64* } } } %xba, 0
    %ba = extractvalue { i64, { i64, { i64, i64* } } } %xba, 1
    %xl1 = insertvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } zeroinitializer, { i64, { i64, i64* } } %xda1, 0
    %xm = insertvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %xl1, { i64, { i64, i64* } } %ba, 1
    br label %while_starta

  while_starta:
    %xea2 = phi { { i64, { i64, i64* } }, { i64, { i64, i64* } } } [ %x16, %ctd_ifd ], [ %xm, %ctd_ifb ]
    %a12 = extractvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %xea2, 0
    %a22 = extractvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %xea2, 1
    %l2 = extractvalue { i64, { i64, i64* } } %a22, 0
    %xfa1 = extractvalue { i64, { i64, i64* } } %a22, 1
    %cb1 = extractvalue { i64, i64* } %xfa1, 0
    %aba = extractvalue { i64, i64* } %xfa1, 1
    %xha = icmp eq i64 %l2, 0
    %x9 = add i1 %xha, 1
    br i1 %x9, label %while_bodya, label %while_enda

  while_bodya:
    %a13 = extractvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %xea2, 0
    %a23 = extractvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %xea2, 1
    %xfa2 = sub i64 1, 1
    %l3 = extractvalue { i64, { i64, i64* } } %a23, 0
    %xga1 = extractvalue { i64, { i64, i64* } } %a23, 1
    %cb2 = extractvalue { i64, i64* } %xga1, 0
    %aba1 = extractvalue { i64, i64* } %xga1, 1
    %xha1 = getelementptr i64, i64* %aba1, i64 %xfa2
    %xja1 = load i64, i64* %xha1
    %la1 = extractvalue { i64, { i64, i64* } } %a23, 0
    %xka1 = extractvalue { i64, { i64, i64* } } %a23, 1
    %cc1 = extractvalue { i64, i64* } %xka1, 0
    %ac1 = extractvalue { i64, i64* } %xka1, 1
    %xma = sub i64 1, 1
    %lb = extractvalue { i64, { i64, i64* } } %a23, 0
    %xna = extractvalue { i64, { i64, i64* } } %a23, 1
    %cd1 = extractvalue { i64, i64* } %xna, 0
    %ad1 = extractvalue { i64, i64* } %xna, 1
    %xoa1 = getelementptr i64, i64* %ad1, i64 %xma
    %xp1 = load i64, i64* %xoa1
    %xqa = sub i64 %la1, 1
    %lc1 = extractvalue { i64, { i64, i64* } } %a23, 0
    %xr = extractvalue { i64, { i64, i64* } } %a23, 1
    %ce1 = extractvalue { i64, i64* } %xr, 0
    %ae1 = extractvalue { i64, i64* } %xr, 1
    %xs = getelementptr i64, i64* %ae1, i64 %xqa
    %xt = load i64, i64* %xs
    %xua = sub i64 1, 1
    %ld1 = extractvalue { i64, { i64, i64* } } %a23, 0
    %xv = extractvalue { i64, { i64, i64* } } %a23, 1
    %cf = extractvalue { i64, i64* } %xv, 0
    %af = extractvalue { i64, i64* } %xv, 1
    %p1 = getelementptr i64, i64* %af, i64 %xua
    store i64 %xt, i64* %p1
    %xw = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %ld1, 0
    %xx = insertvalue { i64, i64* } zeroinitializer, i64 %cf, 0
    %xy = insertvalue { i64, i64* } %xx, i64* %af, 1
    %xxa = insertvalue { i64, { i64, i64* } } %xw, { i64, i64* } %xy, 1
    %xya = sub i64 %la1, 1
    %le1 = extractvalue { i64, { i64, i64* } } %xxa, 0
    %xza = extractvalue { i64, { i64, i64* } } %xxa, 1
    %cg = extractvalue { i64, i64* } %xza, 0
    %ag = extractvalue { i64, i64* } %xza, 1
    %pa = getelementptr i64, i64* %ag, i64 %xya
    store i64 %xp1, i64* %pa
    %ya = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %le1, 0
    %yb = insertvalue { i64, i64* } zeroinitializer, i64 %cg, 0
    %yc = insertvalue { i64, i64* } %yb, i64* %ag, 1
    %yba = insertvalue { i64, { i64, i64* } } %ya, { i64, i64* } %yc, 1
    %lf1 = extractvalue { i64, { i64, i64* } } %yba, 0
    %yca = extractvalue { i64, { i64, i64* } } %yba, 1
    %ch = extractvalue { i64, i64* } %yca, 0
    %ah = extractvalue { i64, i64* } %yca, 1
    %lg1 = sub i64 %lf1, 1
    %yda = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lg1, 0
    %ye = insertvalue { i64, i64* } zeroinitializer, i64 %ch, 0
    %yf = insertvalue { i64, i64* } %ye, i64* %ah, 1
    %yea = insertvalue { i64, { i64, i64* } } %yda, { i64, i64* } %yf, 1
    %yfa = icmp ne i64 %la1, 1
    br i1 %yfa, label %thenc, label %elsec

  thenc:
    %yga = call { i64, { i64, i64* } } @IICF_Impl_Heap_h_sink_impl ({ i64, { i64, i64* } } %yea, i64 1)
    %yha = insertvalue { i64, { i64, { i64, i64* } } } zeroinitializer, i64 %xja1, 0
    %x10 = insertvalue { i64, { i64, { i64, i64* } } } %yha, { i64, { i64, i64* } } %yga, 1
    br label %ctd_ifc

  elsec:
    %yga1 = insertvalue { i64, { i64, { i64, i64* } } } zeroinitializer, i64 %xja1, 0
    %x11 = insertvalue { i64, { i64, { i64, i64* } } } %yga1, { i64, { i64, i64* } } %yea, 1
    br label %ctd_ifc

  ctd_ifc:
    %yga2 = phi { i64, { i64, { i64, i64* } } } [ %x11, %elsec ], [ %x10, %thenc ]
    %a1a = extractvalue { i64, { i64, { i64, i64* } } } %yga2, 0
    %a2a = extractvalue { i64, { i64, { i64, i64* } } } %yga2, 1
    %lh = extractvalue { i64, { i64, i64* } } %a13, 0
    %yh = extractvalue { i64, { i64, i64* } } %a13, 1
    %ci = extractvalue { i64, i64* } %yh, 0
    %ai = extractvalue { i64, i64* } %yh, 1
    %lj = add i64 %lh, 1
    %lk = extractvalue { i64, { i64, i64* } } %a13, 0
    %yia = extractvalue { i64, { i64, i64* } } %a13, 1
    %cj = extractvalue { i64, i64* } %yia, 0
    %aj = extractvalue { i64, i64* } %yia, 1
    %cok1 = icmp sle i64 %lj, %cj
    br i1 %cok1, label %thend, label %elsed

  thend:
    %yj = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lk, 0
    %yk = insertvalue { i64, i64* } zeroinitializer, i64 %cj, 0
    %x12 = insertvalue { i64, i64* } %yk, i64* %aj, 1
    %x13 = insertvalue { i64, { i64, i64* } } %yj, { i64, i64* } %x12, 1
    br label %ctd_ifd

  elsed:
    %yj1 = insertvalue { i64, i64* } zeroinitializer, i64 %cj, 0
    %tmpub = insertvalue { i64, i64* } %yj1, i64* %aj, 1
    %yk1 = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lk, 0
    %x14 = insertvalue { i64, { i64, i64* } } %yk1, { i64, i64* } %tmpub, 1
    %x15 = call { i64, { i64, i64* } } @LLVM_DS_Array_List_arl_resize (i64 %lj, { i64, { i64, i64* } } %x14)
    br label %ctd_ifd

  ctd_ifd:
    %al1 = phi { i64, { i64, i64* } } [ %x15, %elsed ], [ %x13, %thend ]
    %ll = extractvalue { i64, { i64, i64* } } %al1, 0
    %yj2 = extractvalue { i64, { i64, i64* } } %al1, 1
    %ck = extractvalue { i64, i64* } %yj2, 0
    %ak = extractvalue { i64, i64* } %yj2, 1
    %pb = getelementptr i64, i64* %ak, i64 %ll
    store i64 %a1a, i64* %pb
    %lm = add i64 %ll, 1
    %yka = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lm, 0
    %yl = insertvalue { i64, i64* } zeroinitializer, i64 %ck, 0
    %ym = insertvalue { i64, i64* } %yl, i64* %ak, 1
    %yla = insertvalue { i64, { i64, i64* } } %yka, { i64, i64* } %ym, 1
    %yma = insertvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } zeroinitializer, { i64, { i64, i64* } } %yla, 0
    %x16 = insertvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %yma, { i64, { i64, i64* } } %a2a, 1
    br label %while_starta

  while_enda:
    %c_1 = extractvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %xea2, 0
    %baa = extractvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %xea2, 1
    %uu = extractvalue { i64, { i64, i64* } } %baa, 0
    %xfa3 = extractvalue { i64, { i64, i64* } } %baa, 1
    %uua = extractvalue { i64, i64* } %xfa3, 0
    %xga2 = extractvalue { i64, i64* } %xfa3, 1
    call void @LLVM_DS_NArray_narray_free (i64* %xga2)
    %a14 = extractvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %xea2, 0
    %a24 = extractvalue { { i64, { i64, i64* } }, { i64, { i64, i64* } } } %xea2, 1
    ret { i64, { i64, i64* } } %a14
}

define { i64, { i64, i64* } } @IICF_Impl_Heap_h_sink_impl({ i64, { i64, i64* } } %x, i64 %x1) {

  start:
    %x2 = insertvalue { { i64, { i64, i64* } }, i64 } zeroinitializer, { i64, { i64, i64* } } %x, 0
    %x3 = insertvalue { { i64, { i64, i64* } }, i64 } %x2, i64 %x1, 1
    %x4 = call { i64, { i64, i64* } } @IICF_Impl_Heap_h_sink_impl_f_014354172 ({ { i64, { i64, i64* } }, i64 } %x3)
    ret { i64, { i64, i64* } } %x4
}

define { i64, { i64, i64* } } @IICF_Impl_Heap_h_swim_impl({ i64, { i64, i64* } } %x, i64 %x1) {

  start:
    %x2 = insertvalue { { i64, { i64, i64* } }, i64 } zeroinitializer, { i64, { i64, i64* } } %x, 0
    %x3 = insertvalue { { i64, { i64, i64* } }, i64 } %x2, i64 %x1, 1
    %x4 = call { i64, { i64, i64* } } @IICF_Impl_Heap_h_swim_impl_f_014359414 ({ { i64, { i64, i64* } }, i64 } %x3)
    ret { i64, { i64, i64* } } %x4
}

define void @LLVM_DS_NArray_narray_free(i64* %p) {

  start:
    %a = ptrtoint i64* %p to i64
    %b = ptrtoint i64* null to i64
    %tmp = icmp eq i64 %a, %b
    br i1 %tmp, label %then, label %else

  then:
    br label %ctd_if

  else:
    %c = bitcast i64* %p to i8*
    call void @isabelle_llvm_free (i8* %c)
    br label %ctd_if

  ctd_if:
    ret void
}

define { i64, { i64, i64* } } @LLVM_DS_Array_List_arl_resize(i64 %c, { i64, { i64, i64* } } %al) {

  start:
    %l = extractvalue { i64, { i64, i64* } } %al, 0
    %x = extractvalue { i64, { i64, i64* } } %al, 1
    %c1 = extractvalue { i64, i64* } %x, 0
    %a = extractvalue { i64, i64* } %x, 1
    %r = sub i64 0, 1
    %max = lshr i64 %r, 1
    %maxa = udiv i64 %max, 2
    %b = icmp ule i64 %c1, %maxa
    br i1 %b, label %then, label %else

  then:
    %ca = mul i64 %c1, 2
    %cok = icmp sle i64 %c, %ca
    br i1 %cok, label %thena, label %elsea

  thena:
    br label %ctd_ifa

  elsea:
    br label %ctd_ifa

  ctd_ifa:
    %x1 = phi i64 [ %c, %elsea ], [ %ca, %thena ]
    br label %ctd_if

  else:
    br label %ctd_if

  ctd_if:
    %ca1 = phi i64 [ %c, %else ], [ %x1, %ctd_ifa ]
    %tmpc = icmp eq i64 %ca1, 0
    br i1 %tmpc, label %thenb, label %elseb

  thenb:
    br label %ctd_ifb

  elseb:
    %t = getelementptr i64, i64* null, i64 1
    %d = ptrtoint i64* %t to i64
    %e = call i8* @isabelle_llvm_calloc (i64 %ca1, i64 %d)
    %x2 = bitcast i8* %e to i64*
    br label %ctd_ifb

  ctd_ifb:
    %a1 = phi i64* [ %x2, %elseb ], [ null, %thenb ]
    call void @LLVM_DS_Array_arraycpy (i64* %a1, i64* %a, i64 %l)
    call void @LLVM_DS_NArray_narray_free (i64* %a)
    %xaa = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %l, 0
    %xe = insertvalue { i64, i64* } zeroinitializer, i64 %ca1, 0
    %x3 = insertvalue { i64, i64* } %xe, i64* %a1, 1
    %x4 = insertvalue { i64, { i64, i64* } } %xaa, { i64, i64* } %x3, 1
    ret { i64, { i64, i64* } } %x4
}

define { i64, { i64, i64* } } @arl_new() {

  start:
    %tmpd = icmp eq i64 8, 0
    br i1 %tmpd, label %then, label %else

  then:
    br label %ctd_if

  else:
    %t = getelementptr i64, i64* null, i64 1
    %a = ptrtoint i64* %t to i64
    %b = call i8* @isabelle_llvm_calloc (i64 8, i64 %a)
    %x = bitcast i8* %b to i64*
    br label %ctd_if

  ctd_if:
    %aa = phi i64* [ %x, %else ], [ null, %then ]
    %xb = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 0, 0
    %xc = insertvalue { i64, i64* } zeroinitializer, i64 8, 0
    %x1 = insertvalue { i64, i64* } %xc, i64* %aa, 1
    %x2 = insertvalue { i64, { i64, i64* } } %xb, { i64, i64* } %x1, 1
    ret { i64, { i64, i64* } } %x2
}

define { i64, { i64, i64* } } @arl_push_back({ i64, { i64, i64* } } %al, i64 %x) {

  start:
    %l = extractvalue { i64, { i64, i64* } } %al, 0
    %x1 = extractvalue { i64, { i64, i64* } } %al, 1
    %c = extractvalue { i64, i64* } %x1, 0
    %a = extractvalue { i64, i64* } %x1, 1
    %lb = add i64 %l, 1
    %lc = extractvalue { i64, { i64, i64* } } %al, 0
    %xaa = extractvalue { i64, { i64, i64* } } %al, 1
    %ca = extractvalue { i64, i64* } %xaa, 0
    %aa = extractvalue { i64, i64* } %xaa, 1
    %cok = icmp sle i64 %lb, %ca
    br i1 %cok, label %then, label %else

  then:
    %xb = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lc, 0
    %xc = insertvalue { i64, i64* } zeroinitializer, i64 %ca, 0
    %x2 = insertvalue { i64, i64* } %xc, i64* %aa, 1
    %x3 = insertvalue { i64, { i64, i64* } } %xb, { i64, i64* } %x2, 1
    br label %ctd_if

  else:
    %xb1 = insertvalue { i64, i64* } zeroinitializer, i64 %ca, 0
    %tmpa = insertvalue { i64, i64* } %xb1, i64* %aa, 1
    %xc1 = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lc, 0
    %x4 = insertvalue { i64, { i64, i64* } } %xc1, { i64, i64* } %tmpa, 1
    %x5 = call { i64, { i64, i64* } } @LLVM_DS_Array_List_arl_resize (i64 %lb, { i64, { i64, i64* } } %x4)
    br label %ctd_if

  ctd_if:
    %al1 = phi { i64, { i64, i64* } } [ %x5, %else ], [ %x3, %then ]
    %ld = extractvalue { i64, { i64, i64* } } %al1, 0
    %xb2 = extractvalue { i64, { i64, i64* } } %al1, 1
    %cb = extractvalue { i64, i64* } %xb2, 0
    %ab = extractvalue { i64, i64* } %xb2, 1
    %p = getelementptr i64, i64* %ab, i64 %ld
    store i64 %x, i64* %p
    %le = add i64 %ld, 1
    %xca = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %le, 0
    %xd = insertvalue { i64, i64* } zeroinitializer, i64 %cb, 0
    %x6 = insertvalue { i64, i64* } %xd, i64* %ab, 1
    %x7 = insertvalue { i64, { i64, i64* } } %xca, { i64, i64* } %x6, 1
    ret { i64, { i64, i64* } } %x7
}

define { i64, { i64, i64* } } @IICF_Impl_Heap_h_sink_impl_f_014354172({ { i64, { i64, i64* } }, i64 } %x) {

  start:
    %a1 = extractvalue { { i64, { i64, i64* } }, i64 } %x, 0
    %a2 = extractvalue { { i64, { i64, i64* } }, i64 } %x, 1
    %l = extractvalue { i64, { i64, i64* } } %a1, 0
    %xaa = extractvalue { i64, { i64, i64* } } %a1, 1
    %c = extractvalue { i64, i64* } %xaa, 0
    %a = extractvalue { i64, i64* } %xaa, 1
    %xca = udiv i64 %l, 2
    %xd = icmp sle i64 %a2, %xca
    br i1 %xd, label %then, label %else

  then:
    %xe = mul i64 2, %a2
    %xfa = sub i64 %xe, 1
    %la = extractvalue { i64, { i64, i64* } } %a1, 0
    %xg = extractvalue { i64, { i64, i64* } } %a1, 1
    %ca = extractvalue { i64, i64* } %xg, 0
    %aa = extractvalue { i64, i64* } %xg, 1
    %xh = getelementptr i64, i64* %aa, i64 %xfa
    %xi = load i64, i64* %xh
    %xj = icmp slt i64 %xe, %l
    br i1 %xj, label %thena, label %elsea

  thena:
    %xka = add i64 %xe, 1
    %xla = sub i64 %xka, 1
    %lb = extractvalue { i64, { i64, i64* } } %a1, 0
    %xm = extractvalue { i64, { i64, i64* } } %a1, 1
    %cb = extractvalue { i64, i64* } %xm, 0
    %ab = extractvalue { i64, i64* } %xm, 1
    %xn = getelementptr i64, i64* %ab, i64 %xla
    %xo = load i64, i64* %xn
    %xp = icmp slt i64 %xo, %xi
    br i1 %xp, label %thenb, label %elseb

  thenb:
    %x1 = add i64 %xe, 1
    br label %ctd_ifb

  elseb:
    br label %ctd_ifb

  ctd_ifb:
    %x2 = phi i64 [ %xe, %elseb ], [ %x1, %thenb ]
    br label %ctd_ifa

  elsea:
    br label %ctd_ifa

  ctd_ifa:
    %xk = phi i64 [ %xe, %elsea ], [ %x2, %ctd_ifb ]
    %xla1 = sub i64 %xk, 1
    %lb1 = extractvalue { i64, { i64, i64* } } %a1, 0
    %xm1 = extractvalue { i64, { i64, i64* } } %a1, 1
    %cb1 = extractvalue { i64, i64* } %xm1, 0
    %ab1 = extractvalue { i64, i64* } %xm1, 1
    %xn1 = getelementptr i64, i64* %ab1, i64 %xla1
    %xo1 = load i64, i64* %xn1
    %xpa = sub i64 %a2, 1
    %lc = extractvalue { i64, { i64, i64* } } %a1, 0
    %xq = extractvalue { i64, { i64, i64* } } %a1, 1
    %cc = extractvalue { i64, i64* } %xq, 0
    %ac = extractvalue { i64, i64* } %xq, 1
    %xr = getelementptr i64, i64* %ac, i64 %xpa
    %xs = load i64, i64* %xr
    %xt = icmp slt i64 %xo1, %xs
    br i1 %xt, label %thenc, label %elsec

  thenc:
    %xua = sub i64 %a2, 1
    %ld = extractvalue { i64, { i64, i64* } } %a1, 0
    %xv = extractvalue { i64, { i64, i64* } } %a1, 1
    %cd = extractvalue { i64, i64* } %xv, 0
    %ad = extractvalue { i64, i64* } %xv, 1
    %xw = getelementptr i64, i64* %ad, i64 %xua
    %xx = load i64, i64* %xw
    %xya = sub i64 %xk, 1
    %le = extractvalue { i64, { i64, i64* } } %a1, 0
    %xz = extractvalue { i64, { i64, i64* } } %a1, 1
    %ce = extractvalue { i64, i64* } %xz, 0
    %ae = extractvalue { i64, i64* } %xz, 1
    %ya = getelementptr i64, i64* %ae, i64 %xya
    %yb = load i64, i64* %ya
    %yca = sub i64 %a2, 1
    %lf = extractvalue { i64, { i64, i64* } } %a1, 0
    %yd = extractvalue { i64, { i64, i64* } } %a1, 1
    %cg = extractvalue { i64, i64* } %yd, 0
    %af = extractvalue { i64, i64* } %yd, 1
    %p = getelementptr i64, i64* %af, i64 %yca
    store i64 %yb, i64* %p
    %ye = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lf, 0
    %yf = insertvalue { i64, i64* } zeroinitializer, i64 %cg, 0
    %yg = insertvalue { i64, i64* } %yf, i64* %af, 1
    %yfa = insertvalue { i64, { i64, i64* } } %ye, { i64, i64* } %yg, 1
    %yga = sub i64 %xk, 1
    %lg = extractvalue { i64, { i64, i64* } } %yfa, 0
    %yha = extractvalue { i64, { i64, i64* } } %yfa, 1
    %ch = extractvalue { i64, i64* } %yha, 0
    %ag = extractvalue { i64, i64* } %yha, 1
    %pa = getelementptr i64, i64* %ag, i64 %yga
    store i64 %xx, i64* %pa
    %yi = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lg, 0
    %yj = insertvalue { i64, i64* } zeroinitializer, i64 %ch, 0
    %yk = insertvalue { i64, i64* } %yj, i64* %ag, 1
    %yja = insertvalue { i64, { i64, i64* } } %yi, { i64, i64* } %yk, 1
    %yl = insertvalue { { i64, { i64, i64* } }, i64 } zeroinitializer, { i64, { i64, i64* } } %yja, 0
    %x3 = insertvalue { { i64, { i64, i64* } }, i64 } %yl, i64 %xk, 1
    %x4 = call { i64, { i64, i64* } } @IICF_Impl_Heap_h_sink_impl_f_014354172 ({ { i64, { i64, i64* } }, i64 } %x3)
    br label %ctd_ifc

  elsec:
    br label %ctd_ifc

  ctd_ifc:
    %x5 = phi { i64, { i64, i64* } } [ %a1, %elsec ], [ %x4, %thenc ]
    br label %ctd_if

  else:
    br label %ctd_if

  ctd_if:
    %x6 = phi { i64, { i64, i64* } } [ %a1, %else ], [ %x5, %ctd_ifc ]
    ret { i64, { i64, i64* } } %x6
}

define { i64, { i64, i64* } } @IICF_Impl_Heap_h_swim_impl_f_014359414({ { i64, { i64, i64* } }, i64 } %x) {

  start:
    %a1 = extractvalue { { i64, { i64, i64* } }, i64 } %x, 0
    %a2 = extractvalue { { i64, { i64, i64* } }, i64 } %x, 1
    %xaa = udiv i64 %a2, 2
    %xba = icmp slt i64 0, %xaa
    %l = extractvalue { i64, { i64, i64* } } %a1, 0
    %xc = extractvalue { i64, { i64, i64* } } %a1, 1
    %c = extractvalue { i64, i64* } %xc, 0
    %a = extractvalue { i64, i64* } %xc, 1
    %xe = icmp sle i64 %xaa, %l
    %xf = and i1 %xba, %xe
    br i1 %xf, label %then, label %else

  then:
    %xga = udiv i64 %a2, 2
    %xha = sub i64 %xga, 1
    %la = extractvalue { i64, { i64, i64* } } %a1, 0
    %xi = extractvalue { i64, { i64, i64* } } %a1, 1
    %ca = extractvalue { i64, i64* } %xi, 0
    %aa = extractvalue { i64, i64* } %xi, 1
    %xj = getelementptr i64, i64* %aa, i64 %xha
    %xk = load i64, i64* %xj
    %xla = sub i64 %a2, 1
    %lb = extractvalue { i64, { i64, i64* } } %a1, 0
    %xm = extractvalue { i64, { i64, i64* } } %a1, 1
    %cb = extractvalue { i64, i64* } %xm, 0
    %ab = extractvalue { i64, i64* } %xm, 1
    %xn = getelementptr i64, i64* %ab, i64 %xla
    %xo = load i64, i64* %xn
    %xp = icmp sle i64 %xk, %xo
    %xqa = add i1 %xp, 1
    br i1 %xqa, label %thena, label %elsea

  thena:
    %xra = udiv i64 %a2, 2
    %xsa = sub i64 %a2, 1
    %lc = extractvalue { i64, { i64, i64* } } %a1, 0
    %xt = extractvalue { i64, { i64, i64* } } %a1, 1
    %cc = extractvalue { i64, i64* } %xt, 0
    %ac = extractvalue { i64, i64* } %xt, 1
    %xu = getelementptr i64, i64* %ac, i64 %xsa
    %xv = load i64, i64* %xu
    %xwa = sub i64 %xra, 1
    %ld = extractvalue { i64, { i64, i64* } } %a1, 0
    %xx = extractvalue { i64, { i64, i64* } } %a1, 1
    %cd = extractvalue { i64, i64* } %xx, 0
    %ad = extractvalue { i64, i64* } %xx, 1
    %xy = getelementptr i64, i64* %ad, i64 %xwa
    %xz = load i64, i64* %xy
    %yaa = sub i64 %a2, 1
    %le = extractvalue { i64, { i64, i64* } } %a1, 0
    %yb = extractvalue { i64, { i64, i64* } } %a1, 1
    %ce = extractvalue { i64, i64* } %yb, 0
    %ae = extractvalue { i64, i64* } %yb, 1
    %p = getelementptr i64, i64* %ae, i64 %yaa
    store i64 %xz, i64* %p
    %yc = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %le, 0
    %yd = insertvalue { i64, i64* } zeroinitializer, i64 %ce, 0
    %ye = insertvalue { i64, i64* } %yd, i64* %ae, 1
    %yda = insertvalue { i64, { i64, i64* } } %yc, { i64, i64* } %ye, 1
    %yea = sub i64 %xra, 1
    %lf = extractvalue { i64, { i64, i64* } } %yda, 0
    %yfa = extractvalue { i64, { i64, i64* } } %yda, 1
    %cg = extractvalue { i64, i64* } %yfa, 0
    %af = extractvalue { i64, i64* } %yfa, 1
    %pa = getelementptr i64, i64* %af, i64 %yea
    store i64 %xv, i64* %pa
    %yg = insertvalue { i64, { i64, i64* } } zeroinitializer, i64 %lf, 0
    %yh = insertvalue { i64, i64* } zeroinitializer, i64 %cg, 0
    %yi = insertvalue { i64, i64* } %yh, i64* %af, 1
    %yha = insertvalue { i64, { i64, i64* } } %yg, { i64, i64* } %yi, 1
    %yia = udiv i64 %a2, 2
    %yk = insertvalue { { i64, { i64, i64* } }, i64 } zeroinitializer, { i64, { i64, i64* } } %yha, 0
    %x1 = insertvalue { { i64, { i64, i64* } }, i64 } %yk, i64 %yia, 1
    %x2 = call { i64, { i64, i64* } } @IICF_Impl_Heap_h_swim_impl_f_014359414 ({ { i64, { i64, i64* } }, i64 } %x1)
    br label %ctd_ifa

  elsea:
    br label %ctd_ifa

  ctd_ifa:
    %x3 = phi { i64, { i64, i64* } } [ %a1, %elsea ], [ %x2, %thena ]
    br label %ctd_if

  else:
    br label %ctd_if

  ctd_if:
    %x4 = phi { i64, { i64, i64* } } [ %a1, %else ], [ %x3, %ctd_ifa ]
    ret { i64, { i64, i64* } } %x4
}
