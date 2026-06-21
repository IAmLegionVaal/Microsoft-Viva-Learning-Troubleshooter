# Microsoft Viva Learning Troubleshooter

PowerShell 5.1 diagnostics and guarded repair tooling created by **Dewald Pretorius**.

`Troubleshooter.ps1` collects Viva Learning evidence. `Repair.ps1` provides `Diagnose`, `ResetCache`, and `FlushDns`. Cache repair stops Teams/Edge processes, moves existing caches to timestamped backup folders, recreates clean paths, and verifies the result.

```powershell
.\Troubleshooter.ps1
.\Repair.ps1 -Action Diagnose
.\Repair.ps1 -Action ResetCache -DryRun
.\Repair.ps1 -Action ResetCache -Yes
```

Mutating actions require confirmation unless `-Yes` is used. Runs produce a log and pre-repair JSON snapshot. Source-reviewed for Windows PowerShell 5.1; not runtime-tested against every tenant or client build.
