ON INIT {
 SET �go 0
 SET �unlock 0
 ACCEPT
}
ON INITEND {
 SET �lockpickability 100
 ACCEPT
}
ON GAME_READY {
 AMBIANCE -v 90 ambient_crypt_c 
 ACCEPT
}
ON CUSTOM {
 IF (�open == 1) ACCEPT
 IF (^$PARAM1 == "OK1" ) GOTO OK
 IF (^$PARAM1 == "OK2" ) GOTO OK
 IF (^$PARAM1 == "OK3" ) GOTO OK
 IF (^$PARAM1 == "OK4" ) GOTO OK
 IF (^$PARAM1 == "OK5" ) GOTO OK
 IF (^$PARAM1 == "OK6" ) GOTO OK
 IF (^$PARAM1 == "OK6" ) GOTO OK
 IF (^$PARAM1 == "NO1" )  DEC �go 1
 IF (^$PARAM1 == "NO2" )  DEC �go 1
 IF (^$PARAM1 == "NO3" )  DEC �go 1
 IF (^$PARAM1 == "NO4" )  DEC �go 1
 IF (^$PARAM1 == "NO5" )  DEC �go 1
 IF (^$PARAM1 == "NO6" )  DEC �go 1
 IF (^$PARAM1 == "UNLOCK1" ) GOTO UNLOCK
 IF (^$PARAM1 == "UNLOCK2" ) GOTO UNLOCK
 IF (^$PARAM1 == "UNLOCK3" ) GOTO UNLOCK
 IF (^$PARAM1 == "UNLOCK4" ) GOTO UNLOCK
 IF (^$PARAM1 == "UNLOCK5" ) GOTO UNLOCK
 IF (^$PARAM1 == "UNLOCK6" ) GOTO UNLOCK
 IF (^$PARAM1 == "LOCK" ) DEC �unlock 1
 ACCEPT
}

>>OK
 INC �go 1
 IF (�go == 6) GOTO OPEN
 ACCEPT

>>UNLOCK
 INC �unlock 1
 IF (�unlock > 6) SET �unlock 0
 IF (�unlock == 6) GOTO OPEN1
 ACCEPT

>>OPEN
 SENDEVENT OPEN SELF ""
 SENDEVENT TADA PLAYER ""
 ADDXP 1000
 SENDEVENT CUSTOM Puzzle_pillar01_0001 "UNSET"
 SENDEVENT CUSTOM Puzzle_pillar01_0002 "UNSET"
 SENDEVENT CUSTOM Puzzle_pillar01_0003 "UNSET"
 SENDEVENT CUSTOM Puzzle_pillar01_0004 "UNSET"
 SENDEVENT CUSTOM Puzzle_pillar01_0005 "UNSET"
 SENDEVENT CUSTOM Puzzle_pillar01_0006 "UNSET"
 ACCEPT

>>OPEN1
//  SENDEVENT CUSTOM PUZZLE_PILLAR01_0001 "UP"
  SENDEVENT CUSTOM PUZZLE_WHEEL_0001 "LOCK"
//  SENDEVENT CUSTOM PUZZLE_PILLAR01_0002 "UP"
  SENDEVENT CUSTOM PUZZLE_WHEEL_0002 "LOCK"
//  SENDEVENT CUSTOM PUZZLE_PILLAR01_0003 "UP"
  SENDEVENT CUSTOM PUZZLE_WHEEL_0003 "LOCK"
//  SENDEVENT CUSTOM PUZZLE_PILLAR01_0004 "UP"
  SENDEVENT CUSTOM PUZZLE_WHEEL_0004 "LOCK"
//  SENDEVENT CUSTOM PUZZLE_PILLAR01_0005 "UP"
  SENDEVENT CUSTOM PUZZLE_WHEEL_0005 "LOCK"
//  SENDEVENT CUSTOM PUZZLE_PILLAR01_0006 "UP"
  SENDEVENT CUSTOM PUZZLE_WHEEL_0006 "LOCK"
  SENDEVENT CUSTOM CAMERA_0023 "YES"
  SET �unlock 0
  ACCEPT