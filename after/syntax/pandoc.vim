if !has('conceal')
  finish
endif

" Original file is https://github.com/wjakob/wjakob.vim/blob/master/after/syntax/tex.vim

" more reasonably sized symbols that were already defined
syn match mdMathSymbol '\\Rightarrow\>' contained conceal cchar=⇒
syn match mdMathSymbol '\\Leftarrow\>' contained conceal cchar=⇐
" syn match mdMathSymbol '\\rightarrow\>' contained conceal cchar=→
" syn match mdMathSymbol '\\leftarrow\>' contained conceal cchar=←
syn match mdMathSymbol '\\emptyset\>' contained conceal cchar=Ø
syn match mdMathSymbol '\\varphi\>' contained conceal cchar=φ
syn match mdMathSymbol '\\phi\>' contained conceal cchar=Φ
syn match mdMathSymbol '\\langle\>\s*' contained conceal cchar=⟨
syn match mdMathSymbol '\s*\\rangle\>' contained conceal cchar=⟩
syn match mdMathSymbol '\\{\>' contained conceal cchar={
syn match mdMathSymbol '\\}\>' contained conceal cchar=}
syn match mdMathSymbol '\\\\' contained conceal cchar=⏎

" logical symbols
syn match mdMathSymbol '\\lor\>' contained conceal cchar=∨
syn match mdMathSymbol '\\land\>' contained conceal cchar=∧
syn match mdMathSymbol '\\lnot\>' contained conceal cchar=¬
syn match mdMathSymbol '\\implies\>' contained conceal cchar=⇒

" \mathbb characters
" syn match mdMathSymbol '\\mathbb{\s*A\s*}' contained conceal cchar=𝔸
" syn match mdMathSymbol '\\mathbb{\s*B\s*}' contained conceal cchar=𝔹
" syn match mdMathSymbol '\\mathbb{\s*C\s*}' contained conceal cchar=ℂ
" syn match mdMathSymbol '\\mathbb{\s*D\s*}' contained conceal cchar=𝔻
" syn match mdMathSymbol '\\mathbb{\s*E\s*}' contained conceal cchar=𝔼
" syn match mdMathSymbol '\\mathbb{\s*F\s*}' contained conceal cchar=𝔽
" syn match mdMathSymbol '\\mathbb{\s*G\s*}' contained conceal cchar=𝔾
" syn match mdMathSymbol '\\mathbb{\s*H\s*}' contained conceal cchar=ℍ
" syn match mdMathSymbol '\\mathbb{\s*I\s*}' contained conceal cchar=𝕀
" syn match mdMathSymbol '\\mathbb{\s*J\s*}' contained conceal cchar=𝕁
" syn match mdMathSymbol '\\mathbb{\s*K\s*}' contained conceal cchar=𝕂
" syn match mdMathSymbol '\\mathbb{\s*L\s*}' contained conceal cchar=𝕃
" syn match mdMathSymbol '\\mathbb{\s*M\s*}' contained conceal cchar=M
syn match mdMathSymbol '\\mathbb{\s*N\s*}' contained conceal cchar=ℕ
" syn match mdMathSymbol '\\mathbb{\s*O\s*}' contained conceal cchar=𝕆
syn match mdMathSymbol '\\mathbb{\s*P\s*}' contained conceal cchar=ℙ
syn match mdMathSymbol '\\mathbb{\s*Q\s*}' contained conceal cchar=ℚ
syn match mdMathSymbol '\\mathbb{\s*R\s*}' contained conceal cchar=ℝ
" syn match mdMathSymbol '\\mathbb{\s*S\s*}' contained conceal cchar=𝕊
" syn match mdMathSymbol '\\mathbb{\s*T\s*}' contained conceal cchar=𝕋
" syn match mdMathSymbol '\\mathbb{\s*U\s*}' contained conceal cchar=U
" syn match mdMathSymbol '\\mathbb{\s*V\s*}' contained conceal cchar=𝕍
syn match mdMathSymbol '\\mathbb{\s*W\s*}' contained conceal cchar=W
" syn match mdMathSymbol '\\mathbb{\s*X\s*}' contained conceal cchar=𝕏
" syn match mdMathSymbol '\\mathbb{\s*Y\s*}' contained conceal cchar=𝕐
syn match mdMathSymbol '\\mathbb{\s*Z\s*}' contained conceal cchar=ℤ

" \mathsf characters
syn match mdMathSymbol '\\vec{\s*a\s*}' contained conceal cchar=𝕒
syn match mdMathSymbol '\\vec{\s*b\s*}' contained conceal cchar=𝕓
syn match mdMathSymbol '\\vec{\s*c\s*}' contained conceal cchar=𝕔
syn match mdMathSymbol '\\vec{\s*d\s*}' contained conceal cchar=𝕕
syn match mdMathSymbol '\\vec{\s*e\s*}' contained conceal cchar=𝕖
syn match mdMathSymbol '\\vec{\s*f\s*}' contained conceal cchar=𝕗
syn match mdMathSymbol '\\vec{\s*g\s*}' contained conceal cchar=𝕘
syn match mdMathSymbol '\\vec{\s*h\s*}' contained conceal cchar=𝕙
syn match mdMathSymbol '\\vec{\s*i\s*}' contained conceal cchar=𝕚
syn match mdMathSymbol '\\vec{\s*j\s*}' contained conceal cchar=𝕛
syn match mdMathSymbol '\\vec{\s*k\s*}' contained conceal cchar=𝕜
syn match mdMathSymbol '\\vec{\s*l\s*}' contained conceal cchar=𝕝
syn match mdMathSymbol '\\vec{\s*m\s*}' contained conceal cchar=ᵐ
syn match mdMathSymbol '\\vec{\s*n\s*}' contained conceal cchar=𝕟
syn match mdMathSymbol '\\vec{\s*o\s*}' contained conceal cchar=𝕠
syn match mdMathSymbol '\\vec{\s*p\s*}' contained conceal cchar=𝕡
syn match mdMathSymbol '\\vec{\s*q\s*}' contained conceal cchar=𝕢
syn match mdMathSymbol '\\vec{\s*r\s*}' contained conceal cchar=𝕣
syn match mdMathSymbol '\\vec{\s*s\s*}' contained conceal cchar=𝕤
syn match mdMathSymbol '\\vec{\s*t\s*}' contained conceal cchar=𝕥
syn match mdMathSymbol '\\vec{\s*u\s*}' contained conceal cchar=𝕦
syn match mdMathSymbol '\\vec{\s*v\s*}' contained conceal cchar=𝕧
syn match mdMathSymbol '\\vec{\s*w\s*}' contained conceal cchar=ʷ
syn match mdMathSymbol '\\vec{\s*x\s*}' contained conceal cchar=𝕩
syn match mdMathSymbol '\\vec{\s*y\s*}' contained conceal cchar=𝕪
syn match mdMathSymbol '\\vec{\s*z\s*}' contained conceal cchar=𝕫


" \mathfrak characters
" syn match mdMathSymbol '\\mathfrak{\s*C\s*}' contained conceal cchar=ℭ
" syn match mdMathSymbol '\\mathfrak{\s*H\s*}' contained conceal cchar=ℌ
" syn match mdMathSymbol '\\mathfrak{\s*I\s*}' contained conceal cchar=ℑ
" syn match mdMathSymbol '\\mathfrak{\s*R\s*}' contained conceal cchar=ℜ
" syn match mdMathSymbol '\\mathfrak{\s*Z\s*}' contained conceal cchar=ℨ

syn match mdMathSymbol '\\coloneqq\>' contained conceal cchar=≔
syn match mdMathSymbol '\\colon\>' contained conceal cchar=:
syn match mdMathSymbol '\\:' contained conceal cchar= 
syn match mdMathSymbol '\\;' contained conceal cchar= 
syn match mdMathSymbol '\\,' contained conceal cchar= 
syn match mdMathSymbol '\\ ' contained conceal cchar= 
syn match mdMathSymbol '\\quad' contained conceal cchar=  
syn match mdMathSymbol '\\qquad' contained conceal cchar=    
syn match mdMathSymbol '\\sqrt' contained conceal cchar=√
syn match mdMathSymbol '\\sqrt\[3]' contained conceal cchar=∛
syn match mdMathSymbol '\\sqrt\[4]' contained conceal cchar=∜
syn match mdMathSymbol '\\\!' contained conceal
syn match mdMathSymbol '\\therefore' contained conceal cchar=∴
syn match mdMathSymbol '\\because' contained conceal cchar=∵

syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(1\|{1}\)\(2\|{2}\)' contained conceal cchar=½
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(1\|{1}\)\(3\|{3}\)' contained conceal cchar=⅓
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(2\|{2}\)\(3\|{3}\)' contained conceal cchar=⅔
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(1\|{1}\)\(4\|{4}\)' contained conceal cchar=¼
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(1\|{1}\)\(5\|{5}\)' contained conceal cchar=⅕
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(2\|{2}\)\(5\|{5}\)' contained conceal cchar=⅖
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(3\|{3}\)\(5\|{5}\)' contained conceal cchar=⅗
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(4\|{4}\)\(5\|{5}\)' contained conceal cchar=⅘
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(1\|{1}\)\(6\|{6}\)' contained conceal cchar=⅙
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(5\|{5}\)\(6\|{6}\)' contained conceal cchar=⅚
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(1\|{1}\)\(8\|{8}\)' contained conceal cchar=⅛
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(3\|{3}\)\(8\|{8}\)' contained conceal cchar=⅜
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(5\|{5}\)\(8\|{8}\)' contained conceal cchar=⅝
syn match mdMathSymbol '\\\(\(d\|t\)\|\)frac\(7\|{7}\)\(8\|{8}\)' contained conceal cchar=⅞
