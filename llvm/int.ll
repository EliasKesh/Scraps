; ModuleID = 'int.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i486-linux-gnu"
@.str = internal constant [9 x i8] c"x1 = %d\0A\00"		; <[9 x i8]*> [#uses=1]
@.str1 = internal constant [9 x i8] c"xy = %u\0A\00"		; <[9 x i8]*> [#uses=1]

define i32 @main() {
entry:
	%retval = alloca i32		; <i32*> [#uses=2]
	%y1 = alloca i32		; <i32*> [#uses=2]
	%x1 = alloca i32		; <i32*> [#uses=2]
	%tmp = alloca i32		; <i32*> [#uses=2]
	%"alloca point" = bitcast i32 0 to i32		; <i32> [#uses=0]
	store i32 -1, i32* %x1, align 4
	store i32 -1, i32* %y1, align 4
	%tmp1 = getelementptr [9 x i8]* @.str, i32 0, i32 0		; <i8*> [#uses=1]
	%tmp2 = load i32* %x1, align 4		; <i32> [#uses=1]
	%tmp3 = call i32 (i8*, ...)* @printf( i8* noalias  %tmp1, i32 %tmp2 ) nounwind 		; <i32> [#uses=0]
	%tmp4 = getelementptr [9 x i8]* @.str1, i32 0, i32 0		; <i8*> [#uses=1]
	%tmp5 = load i32* %y1, align 4		; <i32> [#uses=1]
	%tmp6 = call i32 (i8*, ...)* @printf( i8* noalias  %tmp4, i32 %tmp5 ) nounwind 		; <i32> [#uses=0]
	store i32 0, i32* %tmp, align 4
	%tmp7 = load i32* %tmp, align 4		; <i32> [#uses=1]
	store i32 %tmp7, i32* %retval, align 4
	br label %return

return:		; preds = %entry
	%retval8 = load i32* %retval		; <i32> [#uses=1]
	ret i32 %retval8
}

declare i32 @printf(i8* noalias , ...) nounwind 
