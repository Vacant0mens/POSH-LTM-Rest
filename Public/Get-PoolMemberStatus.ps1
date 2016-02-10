﻿Function Get-PoolMemberStatus {
<#
.SYNOPSIS
    Get the current session and state values for the specified computer for the specified pool
#>
    param(
        [Parameter(Mandatory=$true)]$F5session,
        [Parameter(Mandatory=$true)]$ComputerName,
        [Parameter(Mandatory=$true)]$PoolName
    )

    $PoolMember = Get-PoolMember -F5session $F5session -ComputerName $ComputerName -PoolName $PoolName

    $PoolMember = $PoolMember | Select-Object -Property name,session,state

    $PoolMember 
}
