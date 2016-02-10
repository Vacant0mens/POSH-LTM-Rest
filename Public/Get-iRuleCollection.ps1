﻿Function Get-iRuleCollection {
<#
.SYNOPSIS
    Get all iRules for the specified F5 LTM device
#>
    param(
        [Parameter(Mandatory=$true)]$F5session
    )

    $iRuleURL = $F5session.BaseURL + "rule"

    Try {
        $iRulesJSON = Invoke-RestMethodOverride -Method Get -Uri $iRuleURL -Credential $F5session.Credential
        $iRulesJSON.items
    }
    Catch {
        Write-Error "Failed to get the list of iRules for the LTM device."
        Write-Error ("StatusCode:" + $_.Exception.Response.StatusCode.value__)
        Write-Error ("StatusDescription:" + $_.Exception.Response.StatusDescription)
    }

}
