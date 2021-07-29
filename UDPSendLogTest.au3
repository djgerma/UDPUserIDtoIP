#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Downloads\Tuziibanez-Profesional-Red-Network-drive-connected.ico
#AutoIt3Wrapper_Outfile_x64=UDPSendLogTest.exe
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Username and IP address Sender
#AutoIt3Wrapper_Res_Fileversion=1.0.0.12
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductName=UDPSendIP
#AutoIt3Wrapper_Res_ProductVersion=1
#AutoIt3Wrapper_Res_CompanyName=Stolle Machinery LLC
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Inet.au3>
#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#Include <Date.au3>
#include <WinAPIFiles.au3>

Global $sFilePath = "C:\SyslogRelay\UDPClientConfig.ini"
Global $aArray = IniReadSection($sFilePath, "Configuration")

Global $szIPADDRESS = $aArray[1][1]
Global $nPORT = $aArray[2][1]
Global $MaxConnection = 100
Global $space = " "
Global $Event = "authentication success"
Global $User = "user:"
Global $Source = "source:"
Global $DateStamp = _NowCalc()
Global $Location = @LogonServer
Global $SleepTime = $aArray[3][1]

While 1

$send1 = $Event & $space & $User & @UserName & $space & $Source & @IPAddress1 & $space & $Source & @IPAddress2
$send2 = $Event & $space & $User & @UserName & $space & $Source & @IPAddress3 & $space & $Source & @IPAddress4



UDPStartup()
$ConnectedSocket2 = -1
$ConnectedSocket2 = UDPOpen($szIPADDRESS,$nPORT)
UDPSend($ConnectedSocket2,$send1)
UDPSend($ConnectedSocket2,$send2)

UDPShutdown()

sleep(Number($SleepTime))
WEnd