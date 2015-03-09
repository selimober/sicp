(define (cube-roots-iter guess prev-guess input) 
   (if (good-enough? guess prev-guess) 
       guess 
       (cube-roots-iter (improve guess input) guess input))) 
  
 (define (good-enough? guess prev-guess input) 
   (> 0.001 (/ (abs (- guess prev-guess)) 
               input))) ;; this should be (abs input) to handle negative inputs. Example: (cube-roots -1) should be -1. Before change, output was 0.33. After fix, output is corrected to -1.000000001794607. 
  
 (define (improve guess input) 
   (/ (+ (/ input (square guess)) 
      (* 2 guess)) 
    3)) 
  
 (define (square x) 
   (* x x)) 
  
 ;;to make sure the first input of guess and prev-guess does not pass the predicate accidentally, use improve here once: 
 ;;to make sure float number is implemented, use 1.0 instead of 1: 
 (define (cube-roots x) 
   (cube-roots-iter (improve 1.0 x) 1 x)) 

