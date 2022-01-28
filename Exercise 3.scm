(define str "helloworld")
(define i 5)
(define (add-underline str i)
  (string-append (substring str 0 i) "_" (substring str i)))