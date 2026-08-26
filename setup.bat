@echo off
title Engine Setup

echo ==============================
echo        Engine Setup
echo ==============================
echo.

:: ==========================================
:: Core HaxeFlixel Dependencies
:: ==========================================

echo [1/4] Installing core dependencies...
echo.

haxelib install lime
haxelib install openfl
haxelib install flixel
haxelib install flixel-addons
haxelib install flixel-ui
haxelib install hxcpp
haxelib install hscript
haxelib install hxcpp-debug-server

echo.
echo Core dependencies installed!
echo.

:: ==========================================
:: HaxeUI
:: ==========================================

echo [2/4] Installing HaxeUI...
echo.

haxelib install haxeui-core
haxelib install haxeui-flixel

echo.
echo HaxeUI installed!
echo.

:: ==========================================
:: Video / Media
:: ==========================================

echo [3/4] Installing media dependencies...
echo.

haxelib install hxvlc

echo.
echo Media dependencies installed!
echo.

:: ==========================================
:: Git Dependencies
:: ==========================================

echo [4/4] Installing Git dependencies...
echo.

haxelib git hscript-iris https://github.com/crowplexus/hscript-iris/
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc master

echo.
echo Git dependencies installed!
echo.

:: ==========================================
:: Finished
:: ==========================================

echo ==============================
echo       Setup Complete!
echo ==============================
echo.

pause