function Stop-PSWSUSSync {
    <#  
    .SYNOPSIS  
        Stops a currently running WSUS sync.
    .DESCRIPTION
        Stops a currently running WSUS sync.
    .NOTES  
        Name: Stop-PSWSUSSync
        Author: Boe Prox
        DateCreated: 24SEPT2010 
               
    .LINK  
        https://learn-powershell.net
    .EXAMPLE
    Stop-PSWSUSSync  

    Description
    -----------
    This command will stop a currently running WSUS synchronization.
           
    #> 
    [cmdletbinding(
    	DefaultParameterSetName = 'update',
    	ConfirmImpact = 'low',
        SupportsShouldProcess = $True
    )]
        Param()
    Begin {
        $sub = $wsus.GetSubscription()      
    }
    Process {
        #Cancel synchronization running on WSUS       
        If ($pscmdlet.ShouldProcess($($wsus.name))) {
            $sub.StopSynchronization() 
            "Synchronization have been cancelled on {0}." -f $wsus.name
        } 
    }   
} 
