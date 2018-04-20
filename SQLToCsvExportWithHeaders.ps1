#Connection Strings
$Database = "Employee"
$Server = "(localdb)\v11.0"

#Export File
$AttachmentPath = "c:\temp\SQLToCsvWithHeader.csv"

# Connect to SQL and query data, extract data to SQL Adapter
$SqlQuery = "SELECT * from tblEmployee"  
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Data Source=$Server;Initial Catalog=$Database;Integrated Security = True"
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = $SqlQuery
$SqlCmd.Connection = $SqlConnection

$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd
$DataSet = New-Object System.Data.DataSet
$nRecs = $SqlAdapter.Fill($DataSet)
$nRecs | Out-Null

#Populate Hash Table
$objTable = $DataSet.Tables[0]

#Export Hash Table to CSV File
$objTable | Export-CSV $AttachmentPath -notypeinformation