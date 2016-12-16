symbol topstep = b1 ' number of steps in sequence
symbol counter = b2 ' general purpose counter

init:
if pin2 = 1 then preload
if pin1 = 1 then preload
if pin0 = 1 then preload

goto init

preload:
pause 500
if topstep > 9 then goto noup
if pin2 = 1 then noup
if pin1 = 1 then noup
if pin0 = 1 then noup
goto success

noup:
pause 50
if pin3 = 1 then cl
if pin2 = 1 then preload
if pin1 = 1 then preload
if pin0 = 1 then preload
goto noup

cl:
topstep = 0
goto preload
success:
if pin2 = 1 then noup
if pin1 = 1 then noup
if pin0 = 1 then noup
pause 100 ' short delay
if pin2 = 1 then noup
if pin1 = 1 then noup
if pin0 = 1 then noup
high B.0
high B.1
high B.2
high B.3 ' all LEDs on
if topstep = 1 then '1 on 7seg
high B.4
low B.5
low B.6
low B.7
endif
if topstep = 2 then '2 on 7seg
low B.4
high B.5
low B.6
low B.7
endif
if topstep = 3 then '3 on 7seg
high B.4
high B.5
low B.6
low B.7
endif
if topstep = 4 then'4 on 7seg
low B.4
low B.5
high B.6
low B.7
endif
if topstep = 5 then '5 on 7seg
high B.4
low B.5
high B.6
low B.7
endif
if topstep = 6 then '6 on 7seg
low B.4
high B.5
high B.6
low B.7
endif
if topstep = 7 then '7 on 7seg
high B.4
high B.5
high B.6
low B.7
endif
if topstep = 8 then '8 on 7seg
low B.4
low B.5
low B.6
high B.7
endif
if topstep = 9 then '9 on 7seg
high B.4
low B.5
low B.6
high B.7
endif
let topstep = topstep + 1 'add another step
goto preload
