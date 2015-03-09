(define (sqrt x)
  (define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (sqrt-iter guess x)
  ; new-if is different than special form 'if'. It evaluates in applicative order
  ; evaluation thus else-clause is always evaluated, recursivly, ad infinitum
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))
  (sqrt-iter 1.0 x))
