;;LISP

;; This function takes each character for shifting
(defun charShift (ch shiftAmt) 
  (let* ((c  (char-code  ch)) (la (char-code #\a)) (ua (char-code #\A)) 
         (base (cond ((<= la c (char-code #\z)) la) 
                     ((<= ua c (char-code #\Z)) ua) 
                     (nil))))
    (if base (code-char (+ (mod (+ (- c base) shiftAmt) 26) base)) ch)))
 
(defun encrypt (str shiftAmt)
  ;; Using the map function then calling charShift to shift the characters 
  (map 'string #'(lambda (c) (charShift c shiftAmt)) str))

;; Just call encrypt and negate the shiftAmt
(defun decrypt (str shiftAmt) (encrypt str (- shiftAmt)))

;; solve just loops from 0 to num (26 in this case) and calls encrypt and print
(defun solve (str num)
  (loop for n from 0 to num
    do (format t "Caesar ~D: ~a~%" n (encrypt str n))))

;; Define the String and the base shiftAmt
(let* ((msg "HAL")
       (shiftAmt 1)
       (encryptedStr (encrypt msg shiftAmt))
       (decryptedStr (decrypt encryptedStr shiftAmt)))
  ;; Call each of the functions
  (format t "Original Text: ~a ~%" msg)
  (format t "Encrypted: ~a ~%" encryptedStr)
  (format t "Decrypted: ~a ~%" decryptedStr)  
  (solve msg 26))
  