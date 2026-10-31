@echo off
echo ====================================================
echo Starting Kisan Mitra Ecosystem (Backend + Frontend)
echo ====================================================
start "Kisan Mitra Backend" cmd /k "set PATH=C:\Users\admin\.gemini\antigravity\scratch\nodejs;%%PATH%% && cd /d C:\Users\admin\.gemini\antigravity\scratch\kisan-mitra\backend && node dist/server.js"
start "Kisan Mitra Frontend" cmd /k "set PATH=C:\Users\admin\.gemini\antigravity\scratch\nodejs;%%PATH%% && cd /d C:\Users\admin\.gemini\antigravity\scratch\kisan-mitra\frontend && npx vite --host 0.0.0.0 --port 5173"
echo Backend running on:  http://localhost:8787
echo Frontend running on: http://localhost:5173
echo ====================================================
