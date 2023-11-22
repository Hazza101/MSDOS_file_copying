@rem This first command stops every line being printed in the terminal 

@echo off

rem This empty variable will be used for the file(provided by the user) containing list of source and destination

set "fileName="

rem allows me to change the value of enviroment variables upon execution i.e. !source! & !destination!

SETLOCAL ENABLEDELAYEDEXPANSION

rem if statement to check if the user has entered 0 parameters
rem if the user has entered no parameters it creates reads user input into a source and a destination variable

if [%1]==[]  (
	
	
	echo This command needs a single parameter
	echo The parameter should be the path to a text file which contains a list of source and destination folders
	echo ------------------------------------------------
 
	
	set /P source=Enter a source file:
	set /P destination=Enter a destination file:
	
	rem checks if the source directory exists
	
	
	if NOT EXIST !source! (
			echo Directory !source! does not exist
			
		
	
	
		) else (
 			if EXIST !destination! (
				set /p answer="Do you want to overwrite !destination!?(Y/N  case sensitive)"
			
				
				if "!answer!" == "Y" (
					echo !source! copied to !destination!
					xcopy /Q /Y /I !source! !destination!
						
				) else ( 
					echo !source! not copied to !destination!
					
				)
			) else (
			
			echo !source! copied to !destination!
			xcopy /Q /Y /I !source! !destination!
			)
		)
	
) else ( 

	
	rem if statement to check if the user has entered 2 or more parameters 
	if NOT [%2]==[] (
		echo This command only takes a single parameter
		echo Please try again
		goto :end
	) else ( 
	
		set fileName=%1
	)

)










for /F "tokens=*" %%a in (%fileName%) do (
	
	set var=%%a
	
	for /f "tokens=1,2" %%i in ("!var!") do (
  		
		rem set continue=Y
		
		echo ----------------------------------------------------------------------------

		if NOT EXIST %%i (
			echo Directory %%i does not exist
			
		) else (
 			if EXIST %%j (
				set /p answer="Do you want to overwrite %%j?(Y/N  case sensitive)"
			
				
				if "!answer!" == "Y" (
					echo %%i copied to %%j
					xcopy /Q /Y /E /I %%i %%j
						
				) else ( 
					echo %%i not copied to %%j
					
				)
			) else (
			
			echo %%i copied to %%j
			xcopy /Q /Y /E /I %%i %%j
			)
		)
		
		
		
)	
	
	
)






:end


