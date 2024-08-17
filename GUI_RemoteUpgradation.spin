CON
  _clkmode        = xtal1 + pll16x    ' Set clock mode to crystal * 16
  _xinfreq        = 5_000_000         ' Set crystal frequency to 5 MHz

  ' UART Configuration
  RX_PIN          = 31                ' UART receive pin
  TX_PIN          = 30                ' UART transmit pin
  BAUD_RATE       = 115_200           ' UART baud rate

  ' System States
  STATE_INIT      = 0
  STATE_IDLE      = 1
  STATE_UPGRADING = 2
  STATE_ERROR     = 3
  STATE_SHUTDOWN  = 4

  ' Menu Options
  CHECK_VERSION   = 1
  START_UPGRADE   = 2
  SHUTDOWN        = 3

  ' Error Codes
  ERR_NONE        = 0
  ERR_COMM        = 1
  ERR_UPGRADE     = 2

OBJ
  pst   : "Parallax Serial Terminal"  ' Include Parallax Serial Terminal object
  time  : "SimpleTools.spin"          ' Include SimpleTools object for timing functions

VAR
  long  currentVersion
  long  latestVersion
  long  systemState
  long  errorCode

PUB Main | choice
  ' System Initialization
  systemState := STATE_INIT
  errorCode := ERR_NONE
  currentVersion := 100               ' Set initial version (e.g., 1.00)
  latestVersion := 101                ' Set latest available version (e.g., 1.01)

  ' Initialize UART communication
  pst.StartRxTx(RX_PIN, TX_PIN, 0, BAUD_RATE)
  time.MSleep(1000)                   ' Wait for terminal to initialize

  ' Perform system checks
  PerformSystemChecks

  ' Main operation loop
  repeat until systemState == STATE_SHUTDOWN
    case systemState
      STATE_IDLE:
        DisplayMenu
        choice := GetUserChoice
        HandleUserChoice(choice)
      
      STATE_UPGRADING:
        PerformUpgrade
      
      STATE_ERROR:
        HandleError
    
    time.MSleep(100)                  ' Small delay to prevent tight loop

  ' Shutdown procedures
  PerformShutdown

PRI PerformSystemChecks
  pst.Str(string("Initializing system..."))
  pst.NewLine
  
  ' Simulate various system checks
  pst.Str(string("Checking hardware integrity... "))
  time.MSleep(500)
  pst.Str(string("OK"))
  pst.NewLine
  
  pst.Str(string("Verifying communication channels... "))
  time.MSleep(500)
  pst.Str(string("OK"))
  pst.NewLine
  
  pst.Str(string("Loading configuration... "))
  time.MSleep(500)
  pst.Str(string("OK"))
  pst.NewLine
  
  systemState := STATE_IDLE
  pst.Str(string("System initialization complete."))
  pst.NewLine
  time.MSleep(1000)

PRI DisplayMenu
  pst.Clear
  pst.Str(string("===== Remote Upgrade System ====="))
  pst.NewLine
  pst.Str(string("1. Check current version"))
  pst.NewLine
  pst.Str(string("2. Start upgrade process"))
  pst.NewLine
  pst.Str(string("3. Shutdown system"))
  pst.NewLine
  pst.Str(string("Enter your choice (1-3): "))

PRI GetUserChoice : choice
  choice := pst.DecIn                 ' Get decimal input from user

PRI HandleUserChoice(choice)
  case choice
    CHECK_VERSION:
      CheckVersion
    START_UPGRADE:
      systemState := STATE_UPGRADING
    SHUTDOWN:
      systemState := STATE_SHUTDOWN
    OTHER:
      pst.Str(string("Invalid choice. Please try again."))
      time.MSleep(1000)

PRI CheckVersion
  pst.Str(string("Current version: "))
  pst.Dec(currentVersion / 100)       ' Display major version
  pst.Char(".")
  pst.Dec(currentVersion // 100)      ' Display minor version
  pst.NewLine

  ' Simulate checking for updates
  pst.Str(string("Checking for updates... "))
  time.MSleep(1000)
  
  if currentVersion < latestVersion
    pst.Str(string("A new version is available!"))
  else
    pst.Str(string("You have the latest version."))
  pst.NewLine
  time.MSleep(2000)

PRI PerformUpgrade | i
  if currentVersion >= latestVersion
    pst.Str(string("You already have the latest version. No upgrade needed."))
    systemState := STATE_IDLE
    return

  pst.Str(string("Starting upgrade process..."))
  pst.NewLine

  ' Simulate upgrade steps
  pst.Str(string("Step 1: Downloading update package... "))
  repeat i from 0 to 100 step 10
    pst.Dec(i)
    pst.Str(string("%"))
    pst.Char(13)  ' Carriage return
    time.MSleep(200)
  pst.Str(string("Complete"))
  pst.NewLine

  pst.Str(string("Step 2: Verifying package integrity... "))
  time.MSleep(1000)
  pst.Str(string("OK"))
  pst.NewLine

  pst.Str(string("Step 3: Applying update"))
  repeat i from 0 to 100 step 20
    pst.Str(string("."))
    time.MSleep(500)
  pst.Str(string(" Done"))
  pst.NewLine

  pst.Str(string("Step 4: Verifying update... "))
  time.MSleep(1000)
  pst.Str(string("OK"))
  pst.NewLine

  currentVersion := latestVersion
  pst.Str(string("Upgrade complete! New version: "))
  pst.Dec(currentVersion / 100)
  pst.Char(".")
  pst.Dec(currentVersion // 100)
  pst.NewLine

  systemState := STATE_IDLE
  time.MSleep(2000)

PRI HandleError
  pst.Str(string("Error occurred: "))
  case errorCode
    ERR_COMM:
      pst.Str(string("Communication error"))
    ERR_UPGRADE:
      pst.Str(string("Upgrade process failed"))
    OTHER:
      pst.Str(string("Unknown error"))
  pst.NewLine
  pst.Str(string("Press any key to return to main menu..."))
  pst.CharIn
  errorCode := ERR_NONE
  systemState := STATE_IDLE

PRI PerformShutdown
  pst.Str(string("Initiating system shutdown..."))
  pst.NewLine
  
  ' Simulate shutdown procedures
  pst.Str(string("Closing active connections... "))
  time.MSleep(500)
  pst.Str(string("Done"))
  pst.NewLine
  
  pst.Str(string("Saving system state... "))
  time.MSleep(500)
  pst.Str(string("Done"))
  pst.NewLine
  
  pst.Str(string("Powering down components... "))
  time.MSleep(500)
  pst.Str(string("Done"))
  pst.NewLine
  
  pst.Str(string("System shutdown complete. It's now safe to turn off the device."))
  pst.NewLine
