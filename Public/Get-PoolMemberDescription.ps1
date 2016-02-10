﻿Function Get-PoolMemberDescription {
<#
.SYNOPSIS
    Get the current session and state values for the specified computer
#>
    param(
        [Parameter(Mandatory=$true)]$F5Session,
        [Parameter(Mandatory=$true)]$ComputerName,
        [Parameter(Mandatory=$true)]$PoolName
    )

    $PoolMember = Get-PoolMember -F5session $F5session -ComputerName $ComputerName -PoolName $PoolName

    $PoolMember = $PoolMember | Select-Object -Property name,description

    $PoolMember.description
}
