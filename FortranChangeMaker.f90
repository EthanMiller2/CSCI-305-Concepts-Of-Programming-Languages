PROGRAM ChangeMaker
IMPLICIT NONE
INTEGER, EXTERNAL :: getUserInput, calcChange
INTEGER :: n, quarters, dimes, nickels, pennies, finalChange
CHARACTER(LEN = 8)  :: DateINFO
CHARACTER(LEN = 4)  :: Year, Month*2, Day*2

CHARACTER(LEN = 10) :: TimeINFO, PrettyDateAndTime*20
CHARACTER(LEN = 2)  :: Hour, Minute, Second*6

n = getUserInput()
finalChange = calcChange(n)

CALL  DATE_AND_TIME(DateINFO, TimeINFO)

Year  = DateINFO(1:4)
Month = DateINFO(5:6)
Day   = DateINFO(7:8)

Hour   = TimeINFO(1:2)
Minute = TimeINFO(3:4)
Second = TimeINFO(5:10)

PrettyDateAndTime = Month // '-' // Day // '-' // Year // ',' // Hour // ':' //$
WRITE(*,*)'PROBLEM PART THREE'
WRITE(*,*)
WRITE(*,*) PrettyDateAndTime
WRITE(*,*)
END PROGRAM ChangeMaker

INTEGER FUNCTION getUserInput()
IMPLICIT NONE
INTEGER :: Input_Value, readStatus

WRITE(*,*) 'Welcome to the Change Maker'
        WRITE(*,*) 'Please input an integer between 0 and 100 to make change fr$
        readInt: DO
                READ(*,*,iostat = readStatus) Input_value
                IF (Input_value < 0 .OR. Input_value > 100) THEN
                        WRITE(*,*) 'Error. Please input an integer between 0 an$
                ElSE IF(readStatus /= 0) THEN
                        WRITE(*,*) 'Error. Please input an integer between 0 an$
                ELSE
                    	EXIT
                END IF
        END DO readInt
getUserInput = Input_value
END FUNCTION getUserInput

INTEGER FUNCTION calcChange(n)
IMPLICIT NONE
INTEGER, INTENT(IN) :: n
INTEGER :: change, quarters, dimes, nickels, pennies
change = n

quarters = change / 25
change = MODULO(change, 25)

dimes = change / 10
change = MODULO(change, 10)

nickels = change / 5
change = MODULO(change, 5)

pennies = change;

WRITE(*,*) 'PROBLEM PART ONE'
WRITE(*,*)
IF(quarters > 0)THEN
WRITE(*,*) quarters, ' Quarter'
END IF

IF(dimes > 0)THEN
        WRITE(*,*) dimes, ' Dime'
END IF

IF(nickels > 0)THEN
        WRITE(*,fmt = "(1x,i0, a)",  ADVANCE = 'NO') nickels, " Nickel"
END IF

IF(pennies > 0)THEN
        WRITE(*,fmt = "(1x,i0, a)",  ADVANCE = 'NO') pennies, " Penny"
END IF
WRITE(*,*)
WRITE(*,*)

IF(change < 5) THEN
        calcChange = change
        RETURN
END IF

END FUNCTION calcChange
