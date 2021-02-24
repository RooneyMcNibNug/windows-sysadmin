## A quick script get the latest block of error sources from the System section of Windows Event Log

Param(
    [string]$Log = "System",
    [string]$Computername = $env:COMPUTERNAME,
    [int32]$Latest = 400,
    [string]$ReportTitle = "Last 400 Event Log Report",
    [Parameter(Mandatory,HelpMessage = "Enter the path for the HTML file.")]
    [string]$Path
)

$data = Get-Eventlog -logname $Log -EntryType Error -Newest $Latest -ComputerName $Computername |
    Group-object -Property Source -NoElement 

# HTML report creation
$footer = "<h5><i>This report was ran on $(Get-Date)</i></h5>"
$css = "http://jdhitsolutions.com/sample.css"
$precontent = "<H1>$Computername</H1><H2>Last $Latest error sources from $Log</H2>"

$data |Sort-Object -Property Count, Name -Descending |
    Select-Object Count, Name | 
    ConvertTo-Html -Title $ReportTitle -PreContent $precontent -PostContent $footer -CssUri $css |
    Out-File -FilePath $Path
    #Invoke-Item $Path
